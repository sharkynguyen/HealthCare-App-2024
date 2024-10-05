import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';

class MyIconButton extends IconButton {
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const MyIconButton(
      {super.key,
      this.backgroundColor,
      this.width,
      this.height,
      required super.onPressed,
      required super.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: colorScheme(context).outlineVariant.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ]),
      child: IconButton.filledTonal(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? colorScheme(context).primaryContainer),
        ),
        onPressed: onPressed,
        padding: context.padding(all: 12),
        icon: icon,
      ),
    );
  }
}
