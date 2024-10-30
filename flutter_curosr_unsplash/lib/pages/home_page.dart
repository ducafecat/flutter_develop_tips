import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/unsplash_service.dart';
import 'photo_detail_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UnsplashService _unsplashService = UnsplashService();
  final ScrollController _scrollController = ScrollController();
  final List<UnsplashPhoto> _photos = [];

  String _currentCategory = '';
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      _loadMorePhotos();
    }
  }

  Future<void> _loadPhotos() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final photos = await _unsplashService.getPhotos(
        page: _currentPage,
        topic: _currentCategory,
      );

      setState(() {
        _photos.addAll(photos);
        _hasMore = photos.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('加载失败: $e')),
        );
      }
    }
  }

  Future<void> _loadMorePhotos() async {
    if (_isLoading || !_hasMore) return;
    _currentPage++;
    await _loadPhotos();
  }

  Future<void> _refreshPhotos() async {
    _currentPage = 1;
    _photos.clear();
    await _loadPhotos();
  }

  void _changeCategory(String categoryId) {
    if (_currentCategory == categoryId) return;
    setState(() {
      _currentCategory = categoryId;
      _photos.clear();
      _currentPage = 1;
      _hasMore = true;
    });
    _loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('壁纸工具'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // 使用 toggleTheme
          ),
        ],
      ),
      body: Column(
        children: [
          // 分类按钮组
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: UnsplashService.categories.length,
              itemBuilder: (context, index) {
                final category = UnsplashService.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    selected: _currentCategory == category.id,
                    label: Text(category.title),
                    onSelected: (_) => _changeCategory(category.id),
                  ),
                );
              },
            ),
          ),

          // 图片网格
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPhotos,
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: _photos.length + (_hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= _photos.length) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary, // 使用主题色
                      ),
                    );
                  }

                  final photo = _photos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailPage(
                            photo: photo,
                            toggleTheme: widget.toggleTheme,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: photo.homeUrl, // 使用 200x200 的图片
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary, // 使用主题色
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
