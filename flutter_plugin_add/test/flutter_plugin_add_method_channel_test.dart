import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_add/flutter_plugin_add_method_channel.dart';

void main() {
  MethodChannelFlutterPluginAdd platform = MethodChannelFlutterPluginAdd();
  const MethodChannel channel = MethodChannel('flutter_plugin_add');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
