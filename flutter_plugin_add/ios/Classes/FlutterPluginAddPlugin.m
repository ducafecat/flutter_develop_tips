#import "FlutterPluginAddPlugin.h"

@implementation FlutterPluginAddPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_add"
            binaryMessenger:[registrar messenger]];
  FlutterPluginAddPlugin* instance = [[FlutterPluginAddPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.ducafecat.counter/eventChannel"  binaryMessenger: [registrar messenger]];
    [eventChannel setStreamHandler:instance];
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

  else if ([@"startCounting" isEqualToString:call.method]) {
      result(@(YES));
  }
    
  else {
    result(FlutterMethodNotImplemented);
  }
}


- (FlutterError*)onListenWithArguments:(id)arguments
                             eventSink:(FlutterEventSink)eventSink {
    self.eventSink = eventSink;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                  target:self
                                                selector:@selector(sendEvent)
                                                userInfo:nil
                                                 repeats:YES];
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    [self.timer invalidate];
    self.timer = nil;
    self.eventSink = nil;
    self.counter = 0;
    return nil;
}

- (void)sendEvent {
  if (self.eventSink) {
      self.counter++;
      self.eventSink(@(self.counter));
  }
}

@end
