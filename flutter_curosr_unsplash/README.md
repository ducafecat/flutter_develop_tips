# Unsplash 壁纸工具

一个使用 Flutter 开发的壁纸应用，基于 Unsplash API，提供高质量图片的浏览、下载和分享功能。

## 功能介绍

### 欢迎页

- 随机显示 Unsplash 图片（480p）
- 支持刷新随机图片
- 显示摄影师信息
- 支持明暗主题切换

### 首页

- 图片瀑布流布局（200x200 缩略图）
- 支持下拉刷新、上拉加载更多
- 横向滚动的分类选择
- 支持明暗主题切换

### 图片详情页

- 高清图片显示（1440p）
- 支持手势缩放和旋转
- 图片保存到相册
- 分享图片链接
- 支持明暗主题切换
- 显示加载进度

## 使用的 Flutter 组件

### 核心组件

- MaterialApp：应用程序框架
- Scaffold：页面布局框架
- Stack：层叠布局
- Column：垂直布局
- GridView：网格布局
- ListView：列表布局

### 第三方组件

- cached_network_image: ^3.3.0 - 图片缓存
- photo_view: ^0.14.0 - 图片查看器
- share_plus: ^10.1.1 - 系统分享
- saver_gallery: ^4.0.0 - 图片保存
- http: ^1.1.0 - 网络请求

### UI 组件

- CircularProgressIndicator - 加载指示器
- FilterChip - 分类选择
- IconButton - 图标按钮
- ElevatedButton - 凸起按钮
- GestureDetector - 手势检测

## 项目结构

```sh
lib/
├── main.dart # 应用程序入口
├── pages/ # 页面目录
│ ├── welcome_page.dart # 欢迎页
│ ├── home_page.dart # 首页
│ └── photo_detail_page.dart # 图片详情页
└── services/ # 服务目录
└── unsplash_service.dart # Unsplash API 服务
android/ # Android 平台相关配置
├── app/
│ ├── build.gradle
│ └── src/
│ └── main/
│ └── AndroidManifest.xml
└── build.gradle
ios/ # iOS 平台相关配置
└── Runner/
└── Info.plist
```

## 开发环境

- Flutter 3.19.0
- Dart 3.5.4
- Android SDK 34.0.0
- Xcode 15.0
