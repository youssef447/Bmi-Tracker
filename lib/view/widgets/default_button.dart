import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultButton extends StatelessWidget {
  final Function()? onClicked;
  final double? elevation;
  final Color? shadowColor;
  final Color? foregroundColor;
  final Color? backgroundColor;

  final Color? sideColor;
  final double? raduis;
  final Widget child;
  final double? width;
  final double? height;

  const DefaultButton(
      {super.key,
      this.onClicked,
      this.width,
      this.height,
      this.backgroundColor,
      this.elevation,
      this.foregroundColor,
      this.shadowColor,
      required this.child,
      this.sideColor,
      this.raduis});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(elevation ?? 0),
          shadowColor:
              WidgetStateProperty.all<Color>(shadowColor ?? Colors.white),
          foregroundColor:
              WidgetStateProperty.all<Color>(foregroundColor ?? Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis ?? 0),
              side: BorderSide(
                color: sideColor ?? Colors.transparent,
              ),
            ),
          ),
          minimumSize: WidgetStateProperty.all(
            Size(width ?? 282.42.w, height ?? 46.11.h),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? HexColor('#7BB3FF'),
          )),
      onPressed: onClicked,
      child: FittedBox(
        child: child,
      ),
    );
  }
}
