import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svgg extends StatelessWidget {
  const Svgg(
    this.assetName, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
  });

  final String assetName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
