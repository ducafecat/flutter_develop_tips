import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entity/product_entity.dart';
import '../../provider/products.dart';

// 1 ConsumerWidget 方式
class NetworkPage extends ConsumerWidget {
  const NetworkPage({super.key});

  // 3 构建视图
  Widget _buildView(AsyncValue<List<ProductEntity>> products) {
    return Center(
      child: switch (products) {
        // 4 根据状态显示不同的视图
        AsyncData<List<ProductEntity>>(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(value[index].name ?? ""),
                subtitle: Text(value[index].description ?? ""),
              );
            },
          ),
        // 5 错误处理
        AsyncError() => const Text('Oops, something unexpected happened'),
        // 6 加载中
        _ => const CircularProgressIndicator(),
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final AsyncValue<List<ProductEntity>> products =
        ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('拉取数据'),
      ),
      body: _buildView(products),
    );
  }
}
