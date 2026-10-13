import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

class CustomGlass extends StatelessWidget {
  const CustomGlass({
    super.key,
    required this.child,
    this.refractionIndex = 1.02,
    this.refractionWidth = 24,
  });
  final Widget child;
  final double refractionIndex;
  final double refractionWidth;

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLens(
      style: LiquidGlassStyle(
        shape: LiquidGlassShape.squircle(cornerRadius: 28),
        refractionIndex: refractionIndex,
        refractionWidth: refractionWidth,
      ),
      child: child,
    );
  }
}
