import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class ContainerSensorData extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String value;
  final String unit;
  final Color colorDataSensor;

  const ContainerSensorData({
    super.key,
    required this.title,
    required this.iconData,
    required this.value,
    required this.unit,
    required this.colorDataSensor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme(context).outline, width: 0.8),
        borderRadius: BorderRadius.circular(context.sizeWidth(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDataSensor(context),
          context.sizedBox(width: 5),
          _builSymbolIcon(context),
        ],
      ),
    );
  }

  Widget _builSymbolIcon(BuildContext context) {
    return Expanded(
      child: Icon(
        iconData,
        size: context.sizeWidth(24),
      ),
    );
  }

  Widget _buildDataSensor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyLarge(context, title, isBold: true),
        context.sizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MyText.titleLarge(
              context,
              value,
              isBold: true,
              color: colorDataSensor,
            ),
            context.sizedBox(width: 5),
            MyText.bodyLarge(
              context,
              unit,
            ),
          ],
        ),
      ],
    );
  }
}
