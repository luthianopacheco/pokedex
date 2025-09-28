import 'package:flutter/material.dart';

class ShaderImage extends StatelessWidget {
  final String imagePath;
  final List<Color> colors;
  final double verticalPadding;
  const ShaderImage({
    super.key,
    required this.imagePath,
    required this.colors,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: colors,
      ).createShader(bounds),
      blendMode: BlendMode.srcATop,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
