import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit= BoxFit.fill,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
