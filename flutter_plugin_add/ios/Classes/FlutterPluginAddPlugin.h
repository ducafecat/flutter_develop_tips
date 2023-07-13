#import <Flutter/Flutter.h>

@interface FlutterPluginAddPlugin : NSObject<FlutterPlugin>

@property (nonatomic, strong) FlutterEventSink eventSink;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger counter;

@end
