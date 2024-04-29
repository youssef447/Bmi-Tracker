import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassCotnainer extends StatelessWidget {
  final Widget child;
  final double? width, height;
  final Color? color;
  const GlassCotnainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: child,
        ),
      ),
    );
  }
}
