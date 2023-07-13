import 'flutter_plugin_add_platform_interface.dart';

class FlutterPluginAdd {
  Future<String?> getPlatformVersion() {
    return FlutterPluginAddPlatform.instance.getPlatformVersion();
  }

  Future<int?> add(int a, int b) {
    return FlutterPluginAddPlatform.instance.add(a, b);
  }
}
