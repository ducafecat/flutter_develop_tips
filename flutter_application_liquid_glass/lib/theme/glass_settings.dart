import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// A clear lens: low tint and frost let the backdrop show through.
final clearGlass = LiquidGlassSettings.ios26Light.copyWith(
  glassColor: const Color(0x20FFFFFF),
  blur: 0.4,
  blurWeight: 0.35,
  frost: 3,
  frostOpacity: 0.12,
  frostWeight: 0.3,
  saturation: 1.15,
  thickness: 24,
);
