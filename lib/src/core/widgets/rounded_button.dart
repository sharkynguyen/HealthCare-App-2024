import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';

class RoundedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color textColor;
  final Color? borderColor;
  final String? imagePath;
  final double buttonTextSize;
  final double? height;
  final VoidCallback? onPressed;
  final ShapeBorder shape;
  final Widget? widget;

  const RoundedButton({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.imagePath,
    this.borderColor,
    this.shape = const StadiumBorder(),
    this.buttonTextSize = 14.0,
    this.height,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.sizeWidth(16))),
      ),
      child: widget ?? Text(buttonText!),
    );
  }
}
