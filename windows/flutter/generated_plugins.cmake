#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  bitsdojo_window_windows
  connectivity_plus
  dart_vlc
  desktop_drop
  dynamic_color
  flutter_acrylic
  geolocator_windows
  local_auth_windows
  local_notifier
  maps_launcher
  network_info_plus
  objectbox_flutter_libs
  pasteboard
  permission_handler_windows
  printing
  quick_notify
  screen_retriever
  secure_application
  share_plus
  system_tray
  url_launcher_windows
  window_manager
  windows_taskbar
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/windows plugins/${ffi_plugin})
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)
