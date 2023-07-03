import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_generater/form.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<dynamic> jsonData = [
    {
      "type": "input",
      "field": "Ff1s5zfzgmk0x",
      "title": "输入框",
      "info": "",
      "_fc_drag_tag": "input",
      "hidden": false,
      "display": true
    },
    {
      "type": "input",
      "field": "Fxf25zfzgn8kc",
      "title": "输入框",
      "info": "",
      "_fc_drag_tag": "input",
      "hidden": false,
      "display": true
    },
    {
      "type": "checkbox",
      "field": "Fn5j5zfzgnxt1",
      "title": "多选框",
      "info": "",
      "effect": {"fetch": ""},
      "options": [
        {"value": "1", "label": "选项1"},
        {"value": "2", "label": "选项2"}
      ],
      "_fc_drag_tag": "checkbox",
      "hidden": false,
      "display": true
    },
    {
      "type": "FcRow",
      "children": [
        {
          "type": "col",
          "props": {"span": 24},
          "children": [
            {
              "type": "input",
              "field": "Fih81nuhorr201",
              "title": "输入框",
              "info": "",
              "_fc_drag_tag": "input",
              "hidden": false,
              "display": true
            },
            {
              "type": "input",
              "field": "Fnac1nuhos3090",
              "title": "输入框",
              "info": "",
              "_fc_drag_tag": "input",
              "hidden": false,
              "display": true
            }
          ],
          "_fc_drag_tag": "col",
          "hidden": false,
          "display": true
        }
      ],
      "_fc_drag_tag": "row",
      "hidden": false,
      "display": true
    },
    {
      "type": "el-button",
      "children": ["按钮"],
      "_fc_drag_tag": "el-button",
      "hidden": false,
      "display": true
    }
  ];

  void setNewValue(String field, String value, List<dynamic> data) {
    for (var item in data) {
      if (item['field'] == field) {
        item['new_value'] = value;
        return;
      } else if (item.containsKey('children')) {
        setNewValue(field, value, item['children']);
      }
    }
  }

  void textFormFieldChanged(Map item, String value) {
    setNewValue(item["field"], value, jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),

        // 保存提交到服务器
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (kDebugMode) {
                print(jsonData);
              }
            },
          ),
        ],
      ),

      // 动态表单
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DynamicForm(
          data: jsonData,
          textFormFieldChanged: textFormFieldChanged,
        ),
      ),
    );
  }
}
