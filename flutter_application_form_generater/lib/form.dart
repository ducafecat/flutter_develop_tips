import 'package:flutter/material.dart';

class DynamicForm extends StatelessWidget {
  const DynamicForm({
    super.key,
    required this.data,
    required this.textFormFieldChanged,
  });

  /// 表单数据
  final List<dynamic> data;

  /// 通用 文字输入框回调
  final Function(Map item, String value) textFormFieldChanged;

  /// 构建表单
  List<Widget> _buildForm(List<dynamic> data) {
    List<Widget> widgets = [];
    for (var item in data) {
      switch (item['type']) {
        case 'input':
          widgets.add(TextFormField(
            decoration: InputDecoration(
              labelText: item['title'],
            ),
            onChanged: (value) => textFormFieldChanged(item, value),
          ));
          break;
        case 'checkbox':
          List<Widget> options = [];
          for (var option in item['options']) {
            options.add(Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text(option['label']),
              ],
            ));
          }
          widgets.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['title']),
              Column(children: options),
            ],
          ));
          break;
        case 'FcRow':
          List<Widget> children = _buildForm(item['children']);
          widgets.add(Row(children: children));
          break;
        case 'col':
          int span = item['props']['span'];
          List<Widget> colChildren = _buildForm(item['children']);
          if (span > 0 && span <= 24) {
            widgets.add(Expanded(
              flex: span,
              child: Column(children: colChildren),
            ));
          } else {
            widgets.add(Column(children: colChildren));
          }
          break;
        case 'el-button':
          widgets.add(ElevatedButton(
            onPressed: () {},
            child: Text(item['children'][0]),
          ));
          break;
        default:
          break;
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildForm(data),
    );
  }
}
