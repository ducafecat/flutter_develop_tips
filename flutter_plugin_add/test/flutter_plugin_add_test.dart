import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_add/flutter_plugin_add.dart';
import 'package:flutter_plugin_add/flutter_plugin_add_platform_interface.dart';
import 'package:flutter_plugin_add/flutter_plugin_add_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginAddPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginAddPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPluginAddPlatform initialPlatform = FlutterPluginAddPlatform.instance;

  test('$MethodChannelFlutterPluginAdd is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPluginAdd>());
  });

  test('getPlatformVersion', () async {
    FlutterPluginAdd flutterPluginAddPlugin = FlutterPluginAdd();
    MockFlutterPluginAddPlatform fakePlatform = MockFlutterPluginAddPlatform();
    FlutterPluginAddPlatform.instance = fakePlatform;

    expect(await flutterPluginAddPlugin.getPlatformVersion(), '42');
  });
}
