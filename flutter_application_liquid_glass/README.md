# 液态玻璃联系人 Demo

基于 Flutter 和 `liquid_glass_widgets ^1.17.1` 的中文联系人界面。

```sh
flutter pub get
flutter run -d macos
```

也可使用 iOS、Android 或其他已配置的 Flutter 平台运行。依赖要求 Flutter 3.41 或更新版本。

- 18 位本地模拟联系人，支持按姓名、公司、电话号码搜索。
- 液态玻璃底部导航：全部、收藏、最近。
- 点击联系人打开底部玻璃详情面板，可收藏、取消收藏，并模拟通话和消息操作。
- 收藏状态仅在本次运行期间保存，不读取系统通讯录，不拨打真实电话。
- 较小窗口中的详情面板可以拖动展开、下滑关闭，内容可以滚动。

验证：

```sh
flutter analyze
flutter test
```
