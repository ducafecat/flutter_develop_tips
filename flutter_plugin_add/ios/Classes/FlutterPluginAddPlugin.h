#import <Flutter/Flutter.h>

@interface FlutterPluginAddPlugin : NSObject<FlutterPlugin>

// FlutterEventSink
@property (nonatomic, strong) FlutterEventSink eventSink;

// 定时器
@property (nonatomic, strong) NSTimer *timer;

// 计数器
@property (nonatomic, assign) NSInteger counter;

@end
