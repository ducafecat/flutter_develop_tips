import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_in_flutter_course/widgets/button.dart';

import 'components/login.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        // 主题
        // buildMaterialThemeAddon(),

        // 字体大小
        // buildTextScaleAddon(),
      ],
      directories: [
        //
        // buildWidgetbookCategory(),

        //
        //buildWidgetbookCategory2(),
      ],
    );
  }

  TextScaleAddon buildTextScaleAddon() {
    return TextScaleAddon(
        setting: TextScaleSetting.firstAsSelected(
            textScales: [1.0, 1.25, 1.5, 1.75, 2]));
  }

  MaterialThemeAddon buildMaterialThemeAddon() {
    return MaterialThemeAddon(
        setting: MaterialThemeSetting.firstAsSelected(themes: [
      WidgetbookTheme(name: "dark", data: ThemeData.dark()),
      WidgetbookTheme(name: "light", data: ThemeData.light()),
    ]));
  }

  WidgetbookCategory buildWidgetbookCategory2() {
    return WidgetbookCategory(
      name: '业务组件',
      children: [
        WidgetbookComponent(
          name: '系统常用',
          useCases: [
            WidgetbookUseCase(
              name: "登录界面",
              builder: (BuildContext context) {
                return LoginForm(
                  title: context.knobs.text(
                    label: '标题 [title]',
                    initialValue: '用户登录',
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: "注册界面",
              builder: (BuildContext context) {
                return LoginForm(
                  title: context.knobs.text(
                    label: '标题 [title]',
                    initialValue: '用户注册',
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  WidgetbookCategory buildWidgetbookCategory() {
    return WidgetbookCategory(
      name: '公共组件',
      children: [
        WidgetbookComponent(
          name: '按钮',
          useCases: [
            WidgetbookUseCase.center(
              name: "红色背景",
              child: MyElevatedButton(
                onPressed: () => print("Button pressed"),
                text: "Click me",
                icon: Icons.arrow_forward,
                buttonColor: Colors.red,
                borderRadius: 16.0,
                height: 60.0,
                width: double.infinity,
              ),
            ),
            WidgetbookUseCase.center(
              name: "蓝色色背景",
              child: MyElevatedButton(
                onPressed: () => print("Button pressed"),
                text: "Click me",
                icon: Icons.arrow_forward,
                buttonColor: Colors.blue,
                borderRadius: 16.0,
                height: 60.0,
                width: double.infinity,
              ),
            )
          ],
        ),
      ],
    );
  }
}
