import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_plugin_add_method_channel.dart';

abstract class FlutterPluginAddPlatform extends PlatformInterface {
  /// Constructs a FlutterPluginAddPlatform.
  FlutterPluginAddPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPluginAddPlatform _instance = MethodChannelFlutterPluginAdd();

  /// The default instance of [FlutterPluginAddPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPluginAdd].
  static FlutterPluginAddPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPluginAddPlatform] when
  /// they register themselves.
  static set instance(FlutterPluginAddPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> add(int a, int b) {
    throw UnimplementedError('add() has not been implemented.');
  }
}
