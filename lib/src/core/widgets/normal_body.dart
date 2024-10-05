import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/app_font.dart';

class NormalBody extends StatelessWidget {
  final String str;
  const NormalBody({super.key, required this.str});

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: AppFont().fontTheme(context).bodySmall,
    );
  }
}
