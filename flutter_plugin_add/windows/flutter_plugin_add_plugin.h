#ifndef FLUTTER_PLUGIN_FLUTTER_PLUGIN_ADD_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_PLUGIN_ADD_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_plugin_add {

class FlutterPluginAddPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterPluginAddPlugin();

  virtual ~FlutterPluginAddPlugin();

  // Disallow copy and assign.
  FlutterPluginAddPlugin(const FlutterPluginAddPlugin&) = delete;
  FlutterPluginAddPlugin& operator=(const FlutterPluginAddPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_plugin_add

#endif  // FLUTTER_PLUGIN_FLUTTER_PLUGIN_ADD_PLUGIN_H_
