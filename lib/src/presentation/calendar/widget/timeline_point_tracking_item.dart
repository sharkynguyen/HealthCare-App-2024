import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class TimelinePointTrackingItem extends StatelessWidget {
  final Color statusColor;
  final String time;
  const TimelinePointTrackingItem(
      {super.key, required this.statusColor, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: MyText.bodySmall(
              context,
              '$time PM',
              isBold: true,
              color: colorScheme(context).outline,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              padding: context.padding(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: statusColor, width: 0.8),
                borderRadius: BorderRadius.circular(context.sizeWidth(16)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(IconsaxOutline.heart_tick),
                  context.sizedBox(width: 10),
                  MyText.bodyLarge(
                    context,
                    '120 Bpm',
                    color: Color(0xff55C306),
                    isBold: true,
                  ),
                  context.sizedBox(width: 20),
                  const Icon(IconsaxOutline.notification_circle),
                  context.sizedBox(width: 10),
                  MyText.bodyLarge(
                    context,
                    '70 %',
                    color: colorScheme(context).primary,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
