import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

Future<void> main(List<String> args) => build(args, (input, output) async {
  if (!input.config.buildCodeAssets) return;

  final builder = CBuilder.library(
    name: 'native_download',
    assetName: 'native_download.g.dart',
    sources: ['src/native_download.c', 'src/native_download.h'],
    libraries: ['curl'],
  );

  await builder.run(input: input, output: output);
});
