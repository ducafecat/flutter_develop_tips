import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/unsplash_service.dart';

class WelcomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const WelcomePage({super.key, required this.toggleTheme});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final UnsplashService _unsplashService = UnsplashService();
  UnsplashPhoto? _currentPhoto;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRandomPhoto();
  }

  Future<void> _loadRandomPhoto() async {
    setState(() => _isLoading = true);
    try {
      final photo = await _unsplashService.getRandomPhoto();
      setState(() {
        _currentPhoto = photo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('加载图片失败: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('欢迎使用'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 背景图片
          if (_currentPhoto != null)
            CachedNetworkImage(
              imageUrl: _currentPhoto!.welcomeUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

          // 内容层
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '欢迎使用',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                if (_currentPhoto != null)
                  Text(
                    'Photo by ${_currentPhoto!.photographer}',
                    style: const TextStyle(color: Colors.white),
                  ),
                const SizedBox(height: 40),
                IconButton(
                  onPressed: _isLoading ? null : _loadRandomPhoto,
                  icon: const Icon(Icons.refresh_rounded),
                  iconSize: 32,
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black26,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text('进入应用'),
                ),
              ],
            ),
          ),

          // 加载指示器
          if (_isLoading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
