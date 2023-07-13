#include "include/flutter_plugin_add/flutter_plugin_add_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_plugin_add_plugin.h"

void FlutterPluginAddPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_plugin_add::FlutterPluginAddPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
