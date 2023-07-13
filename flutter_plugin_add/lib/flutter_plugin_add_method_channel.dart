import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_plugin_add_platform_interface.dart';

/// An implementation of [FlutterPluginAddPlatform] that uses method channels.
class MethodChannelFlutterPluginAdd extends FlutterPluginAddPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_plugin_add');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> add(int a, int b) async {
    final val = await methodChannel.invokeMethod<int>(
      'add',
      <String, int>{
        'a': a,
        'b': b,
      },
    );
    return val;
  }
}
