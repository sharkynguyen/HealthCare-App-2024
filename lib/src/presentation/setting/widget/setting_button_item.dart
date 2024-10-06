import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class SettingButtonItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  const SettingButtonItem(
      {super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 6),
      child: Container(
        padding: context.padding(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme(context).surface,
          borderRadius: BorderRadius.circular(context.sizeWidth(16)),
          boxShadow: [
            BoxShadow(
              color: colorScheme(context).outlineVariant.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(iconData),
            context.sizedBox(width: 10),
            MyText.bodyLarge(context, title),
            const Spacer(),
            const Icon(IconsaxOutline.arrow_right_3)
          ],
        ),
      ),
    );
  }
}
