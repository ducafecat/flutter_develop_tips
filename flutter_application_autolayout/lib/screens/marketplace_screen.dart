import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/components/category_tag.dart';
import 'package:flutter_application_autolayout/components/creator_card.dart';
import 'package:flutter_application_autolayout/components/footer.dart';
import 'package:flutter_application_autolayout/components/header.dart';
import 'package:flutter_application_autolayout/components/hero_banner.dart';
import 'package:flutter_application_autolayout/components/history_card.dart';
import 'package:flutter_application_autolayout/components/nft_card.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';
import 'package:layout/layout.dart';

/// 定义不同断点下的内容边距值
final contentPadding = LayoutValue(
  xs: const EdgeInsets.all(16),
  sm: const EdgeInsets.all(20),
  md: const EdgeInsets.all(24),
  lg: const EdgeInsets.all(30),
);

/// 定义不同断点下的组件间距
final sectionSpacing = LayoutValue(
  xs: 20.0,
  sm: 30.0,
  md: 40.0,
  lg: 50.0,
);

/// NFT 市场页面组件
/// 展示 NFT 市场的主要内容，包括趋势、最新添加、创作者等信息
class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

/// MarketplaceScreen 的状态管理类
/// 处理类别选择、布局适配等状态管理
class _MarketplaceScreenState extends State<MarketplaceScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['Art', 'Music', 'Collectibles', 'Sports'];

  @override
  Widget build(BuildContext context) {
    // 获取当前断点下的间距值
    final double spacing = sectionSpacing.resolve(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: 'NFT Marketplace',
              subtitle: 'Pages / NFT Marketplace',
            ),
            Margin(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroBanner(
                    onExploreClick: () {},
                    onWatchVideoClick: () {},
                  ),
                  SizedBox(height: spacing),
                  _buildCategorySection(),
                  SizedBox(height: spacing),
                  _buildTrendingNFTs(),
                  SizedBox(height: spacing),
                  _buildRecentlyAdded(),
                  SizedBox(height: spacing),
                  _buildCreatorsAndHistory(),
                  SizedBox(height: spacing),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建类别选择区域
  /// 根据屏幕尺寸自适应显示类别标签
  Widget _buildCategorySection() {
    return AdaptiveBuilder(
      xs: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending NFTs',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            children: List.generate(
              _categories.length,
              (index) => CategoryTag(
                title: _categories[index],
                isActive: _selectedCategoryIndex == index,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      md: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trending NFTs',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.textPrimary,
            ),
          ),
          Row(
            children: List.generate(
              _categories.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CategoryTag(
                  title: _categories[index],
                  isActive: _selectedCategoryIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建趋势 NFT 展示区域
  /// 展示热门 NFT 卡片列表
  Widget _buildTrendingNFTs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveBuilder(
          xs: (context) => Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: 'Abstract Colors',
                  author: 'Esthera Jackson',
                  currentBid: '0.91 ETH',
                  imagePath: 'assets/images/abstract_colors.png',
                  onTap: () {},
                ),
              ),
              SizedBox(height: sectionSpacing.resolve(context) / 2),
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: 'ETH AI Brain',
                  author: 'Nick Wilson',
                  currentBid: '2.82 ETH',
                  imagePath: 'assets/images/eth_ai_brain.png',
                  onTap: () {},
                ),
              ),
              SizedBox(height: sectionSpacing.resolve(context) / 2),
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: 'Mesh Gradients',
                  author: 'Will Smith',
                  currentBid: '0.56 ETH',
                  imagePath: 'assets/images/mesh_gradients.png',
                  onTap: () {},
                ),
              ),
            ],
          ),
          md: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NFTCard(
                  title: 'Abstract Colors',
                  author: 'Esthera Jackson',
                  currentBid: '0.91 ETH',
                  imagePath: 'assets/images/abstract_colors.png',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: NFTCard(
                  title: 'ETH AI Brain',
                  author: 'Nick Wilson',
                  currentBid: '2.82 ETH',
                  imagePath: 'assets/images/eth_ai_brain.png',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: NFTCard(
                  title: 'Mesh Gradients',
                  author: 'Will Smith',
                  currentBid: '0.56 ETH',
                  imagePath: 'assets/images/mesh_gradients.png',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyAdded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 20),
        AdaptiveBuilder(
          xs: (context) => Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: 'Swipe Circles',
                  author: 'Peter Will',
                  currentBid: '2.30 ETH',
                  imagePath: 'assets/images/swipe_circles.png',
                  onTap: () {},
                ),
              ),
              SizedBox(height: sectionSpacing.resolve(context) / 2),
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: 'Colorful Heaven',
                  author: 'Mark Benjamin',
                  currentBid: '1.30 ETH',
                  imagePath: 'assets/images/colorful_heaven.png',
                  onTap: () {},
                ),
              ),
              SizedBox(height: sectionSpacing.resolve(context) / 2),
              SizedBox(
                width: double.infinity,
                child: NFTCard(
                  title: '3D Cubes Art',
                  author: 'Manny Gates',
                  currentBid: '6.58 ETH',
                  imagePath: 'assets/images/3d_cubes_art.png',
                  onTap: () {},
                ),
              ),
            ],
          ),
          md: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NFTCard(
                  title: 'Swipe Circles',
                  author: 'Peter Will',
                  currentBid: '2.30 ETH',
                  imagePath: 'assets/images/swipe_circles.png',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: NFTCard(
                  title: 'Colorful Heaven',
                  author: 'Mark Benjamin',
                  currentBid: '1.30 ETH',
                  imagePath: 'assets/images/colorful_heaven.png',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: NFTCard(
                  title: '3D Cubes Art',
                  author: 'Manny Gates',
                  currentBid: '6.58 ETH',
                  imagePath: 'assets/images/3d_cubes_art.png',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCreatorsAndHistory() {
    return AdaptiveBuilder(
      xs: (context) => Column(
        children: [
          _buildTopCreatorsCard(),
          SizedBox(height: sectionSpacing.resolve(context) / 2),
          _buildHistoryCard(),
        ],
      ),
      md: (context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildTopCreatorsCard(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _buildHistoryCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopCreatorsCard() {
    final List<CreatorInfo> creators = [
      CreatorInfo(
        username: '@maddison_c21',
        artworks: '9821',
        rating: 9.0,
        avatarColor: Colors.red,
        avatarPath: 'assets/images/avatars/avatar1.png',
      ),
      CreatorInfo(
        username: '@karl.will02',
        artworks: '7032',
        rating: 7.5,
        avatarColor: Colors.blue,
        avatarPath: 'assets/images/avatars/avatar2.png',
      ),
      CreatorInfo(
        username: '@andreea.1z',
        artworks: '5204',
        rating: 6.8,
        avatarColor: Colors.green,
        avatarPath: 'assets/images/avatars/avatar3.png',
      ),
      CreatorInfo(
        username: '@abraham47.y',
        artworks: '4309',
        rating: 5.5,
        avatarColor: Colors.orange,
        avatarPath: 'assets/images/avatars/avatar4.png',
      ),
      CreatorInfo(
        username: '@simmmple.web',
        artworks: '3871',
        rating: 4.9,
        avatarColor: Colors.purple,
        avatarPath: 'assets/images/avatars/avatar5.png',
      ),
      CreatorInfo(
        username: '@venus.sys',
        artworks: '3152',
        rating: 4.5,
        avatarColor: Colors.teal,
        avatarPath: 'assets/images/avatars/avatar6.png',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Top Creators',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                child: const Text('See all'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Artworks',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Rating',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...creators.asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CreatorCard(
                    creator: entry.value,
                    index: entry.key,
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard() {
    final List<HistoryInfo> history = [
      HistoryInfo(
        title: 'Colorful Heaven',
        author: 'Mark Benjamin',
        time: '30s ago',
        price: '1.30 ETH',
        imagePath: 'assets/images/colorful_heaven.png',
      ),
      HistoryInfo(
        title: 'Abstract Colors',
        author: 'Esthera Jackson',
        time: '58s ago',
        price: '0.91 ETH',
        imagePath: 'assets/images/abstract_colors.png',
      ),
      HistoryInfo(
        title: 'ETH AI Brain',
        author: 'Nick Wilson',
        time: '1m ago',
        price: '2.82 ETH',
        imagePath: 'assets/images/eth_ai_brain.png',
      ),
      HistoryInfo(
        title: 'Swipe Circles',
        author: 'Peter Will',
        time: '1m ago',
        price: '2.30 ETH',
        imagePath: 'assets/images/swipe_circles.png',
      ),
      HistoryInfo(
        title: 'Mesh Gradients',
        author: 'Will Smith',
        time: '2m ago',
        price: '0.56 ETH',
        imagePath: 'assets/images/mesh_gradients.png',
      ),
      HistoryInfo(
        title: '3D Cubes Art',
        author: 'Manny Gates',
        time: '3m ago',
        price: '6.58 ETH',
        imagePath: 'assets/images/3d_cubes_art.png',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'History',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                child: const Text('See all'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...history.asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: HistoryCard(
                    historyInfo: entry.value,
                    isHighlighted: entry.key == 0,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
