import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/app_font.dart';

class MyText extends StatelessWidget {
  final String str;
  final TextStyle? style;
  const MyText({super.key, required this.str, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: style ?? AppFont().fontTheme(context).bodySmall,
    );
  }

  factory MyText.bodySmall(BuildContext context, String str) {
    return MyText(
      str: str,
      style: AppFont().fontTheme(context).bodySmall,
    );
  }

  factory MyText.bodyLarge(BuildContext context, String str, {bool? isBold}) {
    return MyText(
      str: str,
      style: AppFont()
          .fontTheme(context, weight: isBold == true ? FontWeight.bold : null)
          .bodyLarge,
    );
  }
  factory MyText.labelSmall(BuildContext context, String str, {bool? isBold}) {
    return MyText(
      str: str,
      style: AppFont()
          .fontTheme(context, weight: isBold == true ? FontWeight.bold : null)
          .labelSmall,
    );
  }

  factory MyText.labelMedium(BuildContext context, String str, {bool? isBold}) {
    return MyText(
      str: str,
      style: AppFont()
          .fontTheme(context, weight: isBold == true ? FontWeight.bold : null)
          .labelMedium,
    );
  }

  factory MyText.labelLarge(
    BuildContext context,
    String str, {
    bool? isBold,
    Color? color,
  }) {
    return MyText(
      str: str,
      style: AppFont()
          .fontTheme(
            context,
            color: color,
            weight: isBold == true ? FontWeight.bold : null,
          )
          .labelLarge,
    );
  }

  factory MyText.headlineSmall(
    BuildContext context,
    String str, {
    bool? isBold,
    Color? color,
  }) {
    return MyText(
      str: str,
      style: AppFont()
          .fontTheme(
            context,
            color: color,
            weight: isBold == true ? FontWeight.w900 : null,
          )
          .headlineSmall,
    );
  }
}
