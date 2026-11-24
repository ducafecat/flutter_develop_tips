import 'dart:io';

import 'package:ffigen/ffigen.dart';

Future<void> main() async {
  final root = Platform.script.resolve('../');
  final generator = FfiGenerator(
    input: Input(entryPoints: [root.resolve('src/native_download.h')]),
    output: Output(
      dart: DartOutput(path: root.resolve('lib/native_download.g.dart')),
    ),
    visitors: [
      Visitor(
        func: (node) =>
            node.isIncluded = node.name.startsWith('native_download'),
      ),
    ],
  );

  await generator.generate();
}
