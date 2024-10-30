import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

/// Unsplash图片数据模型
class UnsplashPhoto {
  final String id;
  final String welcomeUrl;
  final String homeUrl;
  final String fullUrl;
  final String photographer;

  UnsplashPhoto({
    required this.id,
    required this.welcomeUrl,
    required this.homeUrl,
    required this.fullUrl,
    required this.photographer,
  });

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) {
    String baseUrl = json['urls']['raw'];
    // 欢迎页使用 480p 的缩略图 URL
    String welcomeThumbnailUrl = '$baseUrl&w=854&h=480&fit=crop&q=80';
    // 首页使用 200x200 的缩略图 URL
    String homeThumbnailUrl = '$baseUrl&w=200&h=200&fit=crop&q=80';
    // 高分辨率 URL (1440p)
    String fullResUrl = '$baseUrl&w=2560&h=1440&fit=max&q=80';

    return UnsplashPhoto(
      id: json['id'],
      welcomeUrl: welcomeThumbnailUrl,
      homeUrl: homeThumbnailUrl,
      fullUrl: fullResUrl,
      photographer: json['user']['name'],
    );
  }
}

/// Unsplash分类数据模型
class UnsplashCategory {
  final String id;
  final String title;

  UnsplashCategory({required this.id, required this.title});
}

/// Unsplash服务类
class UnsplashService {
  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      ''; // 请替换成你的access key

  // 预定义分类列表
  static final List<UnsplashCategory> categories = [
    UnsplashCategory(id: '', title: '全部'),
    UnsplashCategory(id: 'nature', title: '自然'),
    UnsplashCategory(id: 'architecture', title: '建筑'),
    UnsplashCategory(id: 'travel', title: '旅行'),
    UnsplashCategory(id: 'animals', title: '动物'),
    UnsplashCategory(id: 'food', title: '美食'),
    UnsplashCategory(id: 'people', title: '人物'),
    UnsplashCategory(id: 'technology', title: '科技'),
  ];

  /// 获取随机图片
  ///
  /// 返回一个[UnsplashPhoto]对象
  /// 如果请求失败，则抛出异常
  Future<UnsplashPhoto> getRandomPhoto() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/photos/random'),
        headers: {
          'Authorization': 'Client-ID $_accessKey',
        },
      );

      if (response.statusCode == 200) {
        return UnsplashPhoto.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load photo');
      }
    } catch (e) {
      throw Exception('Error fetching photo: $e');
    }
  }

  /// 获取图片列表
  ///
  /// [page] 页码，从1开始
  /// [perPage] 每页数量，默认30
  /// [topic] 可选的分类ID
  Future<List<UnsplashPhoto>> getPhotos({
    required int page,
    int perPage = 30,
    String? topic,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'per_page': perPage.toString(),
      };

      final Uri uri;
      if (topic != null && topic.isNotEmpty) {
        // 如果有分类，使用搜索接口
        uri = Uri.parse('$_baseUrl/search/photos').replace(
          queryParameters: {...queryParams, 'query': topic},
        );
      } else {
        // 如果没有分类，使用普通列表接口
        uri = Uri.parse('$_baseUrl/photos').replace(
          queryParameters: queryParams,
        );
      }

      developer.log('Fetching photos from: ${uri.toString()}');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Client-ID $_accessKey',
        },
      );

      developer.log('Response status code: ${response.statusCode}');
      developer.log(
          'Response body: ${response.body.substring(0, 200)}...'); // 只打印前200个字符

      if (response.statusCode == 200) {
        final dynamic decodedData = json.decode(response.body);
        List<dynamic> jsonList;

        if (topic != null && topic.isNotEmpty) {
          // 搜索接口
          if (decodedData is Map<String, dynamic> &&
              decodedData.containsKey('results')) {
            jsonList = decodedData['results'] as List<dynamic>;
          } else {
            throw Exception('Invalid search response format');
          }
        } else {
          // 普通列表接口
          if (decodedData is List) {
            jsonList = decodedData;
          } else {
            throw Exception('Invalid list response format');
          }
        }

        developer.log('Found ${jsonList.length} photos');
        return jsonList.map((json) => UnsplashPhoto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      developer.log(
        'Error fetching photos',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching photos: $e');
    }
  }
}
