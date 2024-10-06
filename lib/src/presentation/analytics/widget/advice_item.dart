import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class AdviceItem extends StatelessWidget {
  const AdviceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 12),
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
            MyText.bodySmall(context, '80:45 PM 12/03/2024'),
            Padding(
              padding: context.padding(vertical: 5),
              child: MyText.bodyLarge(
                  context, 'Nhịp tim và nồng độ Oxy đang ổn định'),
            ),
          ],
        ),
      ),
    );
  }
}
