package com.bluebubbles.messaging.workers;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.content.res.AssetManager;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.work.Data;
import androidx.work.ExistingWorkPolicy;
import androidx.work.OneTimeWorkRequest;
import androidx.work.WorkManager;
import androidx.work.Worker;
import androidx.work.WorkerParameters;

import com.baseflow.permissionhandler.PermissionHandlerPlugin;
import com.bluebubbles.messaging.helpers.NotifyRunnable;
import com.bluebubbles.messaging.method_call_handler.MethodCallHandler;

import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import io.flutter.view.FlutterCallbackInformation;
import io.flutter.view.FlutterMain;
import io.flutter.view.FlutterNativeView;
import io.flutter.view.FlutterRunArguments;
import io.flutter.FlutterInjector;

import io.flutter.embedding.engine.loader.FlutterLoader;
import io.flutter.embedding.engine.loader.ApplicationInfoLoader;
import io.flutter.embedding.engine.loader.FlutterApplicationInfo;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.PluginRegistry;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.embedding.engine.dart.DartExecutor.DartCallback;

import static com.bluebubbles.messaging.MainActivity.engine;
import static com.bluebubbles.messaging.MainActivity.CHANNEL;
import static com.bluebubbles.messaging.method_call_handler.handlers.InitializeBackgroundHandle.BACKGROUND_HANDLE_SHARED_PREF_KEY;
import static com.bluebubbles.messaging.method_call_handler.handlers.InitializeBackgroundHandle.BACKGROUND_SERVICE_SHARED_PREF;

public class NotificationWorker extends Worker implements DartWorker {

    private FlutterEngine backgroundEngine;
    private MethodChannel backgroundChannel;
    private Context context;


    public NotificationWorker(@NonNull Context context, @NonNull WorkerParameters workerParams) {
        super(context, workerParams);
        this.context = context;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @NonNull
    @Override
    public Result doWork() {

        String type = getInputData().getString("type");
        Log.d("BlueBubblesApp", "type: " + type);
        if (type.equals("reply") || type.equals("markAsRead") || type.equals("alarm-wake")) {
            getBackgroundChannel();
            invokeMethod();

            // We don't want to finish this worker until we know the backgroundChannel is finished
            // The backgroundChannel is manually closed through dart code
            // we don't close the background channel when replying because we can't await all
            // the functions due to the socket connection required to send the message
            while (backgroundChannel != null && !isStopped()) {
            }
            return Result.success();
        } else {
            return Result.failure();
        }
    }

    @Override
    public void onStopped() {
        Log.d("BlueBubblesApp", "Stopping Notification Worker...");

        // When this worker gets cancelled, clean up
        destroyHeadlessThread();
        super.onStopped();
    }

    @RequiresApi(api = Build.VERSION_CODES.P)
    private void initHeadlessThread() {
        Context context = (this.context != null) ? this.context : getApplicationContext();
        FlutterMain.startInitialization(context);
        FlutterMain.ensureInitializationComplete(getApplicationContext(), null);

        FlutterApplicationInfo info = ApplicationInfoLoader.load(context);
        String appBundlePath = info.flutterAssetsDir;
        AssetManager assets = context.getAssets();

        if (backgroundEngine == null) {
            backgroundEngine = new FlutterEngine(context);
            DartExecutor executor = backgroundEngine.getDartExecutor();
            Long callbackHandle = context.getSharedPreferences(BACKGROUND_SERVICE_SHARED_PREF, Context.MODE_PRIVATE).getLong(BACKGROUND_HANDLE_SHARED_PREF_KEY, -1);
            FlutterCallbackInformation callbackInformation = FlutterCallbackInformation.lookupCallbackInformation(callbackHandle);

            if (callbackInformation == null) {
                Log.e("BlueBubblesApp", "Fatal: failed to find callback: " + callbackHandle);
                return;
            }

            DartExecutor.DartCallback dartCallback = new DartExecutor.DartCallback(
                    assets,
                    appBundlePath,
                    callbackInformation
            );
            executor.executeDartCallback(dartCallback);

            backgroundChannel = new MethodChannel(backgroundEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);
            backgroundChannel.setMethodCallHandler((call, result) -> MethodCallHandler.methodCallHandler(call, result, context, this));
        }
    }

    @Override
    public MethodChannel destroyHeadlessThread() {
        if (backgroundEngine == null) return null;
        new Handler(Looper.getMainLooper()).post(() -> {
            if (backgroundEngine != null) {
                try {
                    Log.d("BlueBubblesApp", "Destroying Notification Worker isolate...");
                    backgroundEngine.destroy();
                    backgroundEngine = null;
                    backgroundChannel = null;
                } catch (Exception e) {
                    Log.d("BlueBubblesApp", "Failed to destroy Notification Worker isolate!");
                }
            }
        });
        return null;
    }

    private void invokeMethod() {
        if (backgroundChannel != null) {
            Handler handler = new Handler(Looper.getMainLooper());
            synchronized (handler) {
                NotifyRunnable runnable = new NotifyRunnable(handler, () -> backgroundChannel.invokeMethod(getInputData().getString("type"), getInputData().getKeyValueMap()));
                handler.post(runnable);
                while (!runnable.isFinished()) {
                    try {
                        handler.wait();
                    } catch (InterruptedException is) {
                        // ignore
                    }
                }
            }
        }
    }


    @RequiresApi(api = Build.VERSION_CODES.O)
    public MethodChannel getBackgroundChannel() {
        if (backgroundChannel == null) {

            Handler handler = new Handler(Looper.getMainLooper());
            synchronized (handler) {
                NotifyRunnable runnable = new NotifyRunnable(handler, () -> initHeadlessThread());
                handler.post(runnable);
                while (!runnable.isFinished()) {
                    try {
                        handler.wait();
                    } catch (InterruptedException is) {
                        // ignore
                    }
                }
            }
        }
        return backgroundChannel;
    }

    public static void createWorker(Context context, String type, Map<String, Object> data) {
        if (engine != null) return;
        OneTimeWorkRequest notificationWork = new OneTimeWorkRequest.Builder(NotificationWorker.class)
                .setInputData(
                        new Data.Builder()
                                .putString("type", type)
                                .putAll(data)
                                .build()
                )
                .addTag(FCMWorker.TAG)
                .build();
        WorkManager.getInstance(context).enqueueUniqueWork(FCMWorker.TAG, ExistingWorkPolicy.APPEND_OR_REPLACE, notificationWork);
    }
}
