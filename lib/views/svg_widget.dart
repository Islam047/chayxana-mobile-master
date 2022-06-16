
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OpenSVG extends StatelessWidget {
  final String path;
  final Color? color;
  final bool isGradient;
  final double width;
  final double height;

  const OpenSVG(
      {Key? key,
        required this.path,
        this.color = AppColors.activeColor,
        this.isGradient = false,
        this.width = 150,
        this.height = 162.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGradient
        ? LinearGradientMask(
      child: SvgPicture.asset(
        path,
        semanticsLabel: path,
        width: width,
        cacheColorFilter: true,
        height: height,
      ),
    )
        : SvgPicture.asset(
      path,
      color: color,
      semanticsLabel: path,
      width: width,
      cacheColorFilter: true,
      height: height,
    );
  }
}

class LinearGradientMask extends StatelessWidget {
  final Widget child;

  const LinearGradientMask({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: AppColors.gradientColor,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}