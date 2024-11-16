import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class AdviceItem extends StatelessWidget {
  final String advice;
  final String updatedAt;
  const AdviceItem({super.key, required this.advice, required this.updatedAt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 6),
      child: Container(
        padding: context.padding(horizontal: 24, vertical: 12),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme(context).outline, width: 0.8),
          color: colorScheme(context).surface,
          borderRadius: BorderRadius.circular(context.sizeWidth(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText.bodySmall(context, updatedAt),
            Padding(
              padding: context.padding(vertical: 5),
              child: MyText.bodyLarge(context, advice),
            ),
          ],
        ),
      ),
    );
  }
}
