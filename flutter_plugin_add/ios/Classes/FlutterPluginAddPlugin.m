#import "FlutterPluginAddPlugin.h"

@implementation FlutterPluginAddPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_add"
            binaryMessenger:[registrar messenger]];
  FlutterPluginAddPlugin* instance = [[FlutterPluginAddPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  
  else if ([@"add" isEqualToString:call.method]) {
      int a = [call.arguments[@"a"] intValue];
      int b = [call.arguments[@"b"] intValue];
      result(@(a + b));
  }

  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
