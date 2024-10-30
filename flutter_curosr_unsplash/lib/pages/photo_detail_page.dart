import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:http/http.dart' as http;
import '../services/unsplash_service.dart';

class PhotoDetailPage extends StatelessWidget {
  final UnsplashPhoto photo;
  final VoidCallback toggleTheme;

  const PhotoDetailPage({
    super.key,
    required this.photo,
    required this.toggleTheme,
  });

  Future<void> _shareImage() async {
    await Share.share(
      '来自 Unsplash 的图片 by ${photo.photographer}\n${photo.fullUrl}',
      subject: 'Unsplash 图片分享',
    );
  }

  Future<void> _saveImage(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(photo.fullUrl));
      if (response.statusCode == 200) {
        final u8Val = Uint8List.fromList(response.bodyBytes);
        final result = await SaverGallery.saveImage(
          u8Val,
          quality: 100,
          fileName: "unsplash_${photo.id}.jpg",
          skipIfExists: false,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.isSuccess ? '图片已保存到相册' : '保存失败')),
          );
        }
      } else {
        throw Exception('图片下载失败');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('By ${photo.photographer}'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: () => _saveImage(context),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareImage,
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(photo.fullUrl),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2.0,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        loadingBuilder: (context, event) => Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: photo.homeUrl, // 使用 homeUrl 作为占位符
              fit: BoxFit.cover,
            ),
            Center(
              child: CircularProgressIndicator(
                value: event == null
                    ? null
                    : event.cumulativeBytesLoaded /
                        (event.expectedTotalBytes ?? 1),
                strokeWidth: 4.0, // 加粗线条
                color: Theme.of(context).colorScheme.secondary, // 使用主题色
              ),
            ),
            Center(
              child: Text(
                '${((event?.cumulativeBytesLoaded ?? 0) / (event?.expectedTotalBytes ?? 1) * 100).toInt()}%', // 只显示整数部分
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
