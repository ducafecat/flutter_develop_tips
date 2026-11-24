# Flutter FFIgen + libcurl 下载示例

Flutter 3.50 / Dart 3.14 的 macOS 示例。输入 HTTP 或 HTTPS 文件地址，点击 **下载文件**。下载完成后会显示文件大小和本地路径，可以复制路径。

## 运行

需要 macOS 14 或更新版本、能正常构建 macOS App 的 Xcode，以及 Flutter 3.50。示例使用 Xcode SDK 中的系统 libcurl。

```bash
flutter doctor -v
flutter pub get
flutter run -d macos
```

默认下载 curl 官方 SVG。文件保存到项目的 `tmp/` 目录（自动创建），同名文件会被替换。下载过程中使用独立临时子目录，成功后把 `.part` 移动成最终文件，结束时清理临时子目录。为允许写入项目目录，此示例已关闭 macOS App 沙盒。项目默认路径配置在 `lib/curl_download.dart` 中；移动项目后，使用 `flutter run -d macos --dart-define=PROJECT_DIR=/新的项目绝对路径` 指定目录。每次请求最多跟随五次重定向，连接超时 10 秒，请求总超时 60 秒。整文件下载需要最终 HTTP 状态为 `200`。

## 代码位置

| 文件 | 用途 |
| --- | --- |
| `lib/main.dart` | URL 输入、下载状态、文件大小与路径 |
| `lib/curl_download.dart` | 后台 isolate、UTF-8 字符串、临时文件和错误处理 |
| `src/native_download.h` | 供 FFIgen 读取的两个 C 函数 |
| `src/native_download.c` | 调用 libcurl，把响应流式写入磁盘 |
| `tool/ffigen.dart` | Dart 版 FFIgen 配置 |
| `lib/native_download.g.dart` | FFIgen 生成的 Dart 绑定 |
| `hook/build.dart` | 编译 C 封装，用 `-lcurl` 链接系统库并注册 code asset |
| `macos/Runner/*.entitlements` | Debug、Profile 和 Release 的出站网络权限 |

`curl_easy_perform()` 是阻塞调用，因此放在 `Isolate.run()` 中执行。C 封装负责处理 libcurl 的可变参数接口，绑定只暴露固定签名。

## 修改 C 接口后重新生成绑定

```bash
dart run tool/ffigen.dart
flutter run -d macos
```

只改 C 函数实现时，停止 App 并再次运行 `flutter run -d macos` 即可触发原生构建。示例使用 libcurl 7.85 起提供的协议选项。

## 资料

- [Flutter FFIgen](https://docs.flutter.dev/interop/ffigen)
- [Dart Build Hooks](https://dart.dev/tools/hooks)
- [libcurl C API](https://curl.se/libcurl/c/)
