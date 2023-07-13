package com.ducafecat.flutter_plugin_add;

import android.os.Handler;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterPluginAddPlugin */
public class FlutterPluginAddPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  // 日志标签
  final String TAG_NAME = "From_Native";
  // 事件通道名称
  public static final String eventChannelName = "com.ducafecat.counter/eventChannel";
  // 事件通道
  private EventChannel.EventSink eventChannel;
  // 计数器
  private int count = 0;
  // 事件 Handler
  private Handler eventHandler;

  // 消息传递器
  private BinaryMessenger binaryMessenger;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    binaryMessenger = flutterPluginBinding.getBinaryMessenger();

    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_plugin_add");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }

    // add
    else if (call.method.equals("add")) {
      int a = call.argument("a");
      int b = call.argument("b");
      int sum = add(a, b);
      result.success(sum);
    }

    // start
    else if (call.method.equals("startCounting")) {
      new EventChannel(binaryMessenger, eventChannelName).setStreamHandler(
              new EventChannel.StreamHandler() {
                @Override
                public void onListen(Object args, final EventChannel.EventSink events) {
                  Log.w(TAG_NAME, "Adding listener");
                  eventChannel = events;
                  count = 0;
                  eventHandler = new Handler();
                  runnable.run();
                }

                @Override
                public void onCancel(Object args) {
                  Log.w(TAG_NAME, "Cancelling listener");
                  eventHandler.removeCallbacks(runnable);
                  eventHandler = null;
                  count = 0;
                  eventChannel = null;
                  System.out.println("StreamHandler - onCanceled: ");
                }
              }
      );
      result.success(true);
    }

    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private int add(int a, int b) {
    return a + b;
  }

  private final Runnable runnable = new Runnable() {
    @Override
    public void run() {
      int TOTAL_COUNT = 50;
      if (count >= TOTAL_COUNT) {
        eventChannel.endOfStream();
      } else {
        count++;
        Log.w(TAG_NAME, "\nParsing From Native:  " + count);
        eventChannel.success(count);
      }

      eventHandler.postDelayed(this, 200);
    }
  };


}
