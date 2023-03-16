import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class DebouncePage extends StatefulWidget {
  const DebouncePage({super.key});

  @override
  State<DebouncePage> createState() => _DebouncePageState();
}

class _DebouncePageState extends State<DebouncePage> {
  List<Country> countryOptions = <Country>[
    const Country(name: 'Africa', size: 30370000),
    const Country(name: 'Asia', size: 44579000),
    const Country(name: 'Australia', size: 8600000),
    const Country(name: 'Bulgaria', size: 110879),
    const Country(name: 'Canada', size: 9984670),
    const Country(name: 'Denmark', size: 42916),
    const Country(name: 'Europe', size: 10180000),
    const Country(name: 'India', size: 3287263),
    const Country(name: 'North America', size: 24709000),
    const Country(name: 'South America', size: 17840000),
  ];

  // 标记是否正在防抖
  bool isDebounce = false;
  // 防抖查询值
  String debounceValue = "";

  Widget _mainView() {
    return Autocomplete<Country>(
      // 返回可选列表数据值
      optionsBuilder: (TextEditingValue textEditingValue) async {
        debounceValue = textEditingValue.text;
        return countryOptions
            .where((Country county) => county.name
                .toLowerCase()
                .startsWith(debounceValue.toLowerCase()))
            .toList();
      },

      // // 返回可选列表数据值
      // optionsBuilder: (TextEditingValue textEditingValue) async {
      //   debounceValue = textEditingValue.text;
      //   // 防抖处理
      //   // 防抖状态下直接返回空 List []
      //   if (isDebounce) {
      //     return Future.value([]);
      //   } else {
      //     isDebounce = true; // 设置防抖标志
      //     // 1秒防抖直接返回 FutureOr
      //     return Future.delayed(const Duration(seconds: 1), () async {
      //       List<Country> rows = [];
      //       // http 拉取数据
      //       try {
      //         rows = await Future.delayed(
      //             const Duration(milliseconds: 500), // 延迟 500 毫秒，模拟 http 请求
      //             () => countryOptions
      //                 .where((Country county) => county.name
      //                     .toLowerCase()
      //                     .startsWith(debounceValue.toLowerCase()))
      //                 .toList());
      //       } finally {
      //         isDebounce = false; // 关闭防抖标志
      //       }
      //       return rows;
      //     });
      //   }
      // },

      // 格式化显示字段
      displayStringForOption: (Country option) => option.name,

      // 输入字段组件
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontSize: 24,
          ),
        );
      },

      // 选中项时
      onSelected: (Country selection) {
        if (kDebugMode) {
          print('Selected: ${selection.name}');
        }
      },

      // 构建下拉列表项
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<Country> onSelected,
        Iterable<Country> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: 300,
              color: Colors.cyan,
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final Country option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option.name,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autocomplete Getx 防抖")),
      body: Padding(padding: const EdgeInsets.all(10), child: _mainView()),
    );
  }
}
