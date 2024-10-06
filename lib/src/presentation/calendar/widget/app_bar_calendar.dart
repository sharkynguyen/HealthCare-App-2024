import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/assets.gen.dart';
import 'package:health_care_app/src/core/widgets/my_rounded_button.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/di/di.dart';

class AppBarCalendar extends StatefulWidget {
  const AppBarCalendar({super.key});

  @override
  State<AppBarCalendar> createState() => _AppBarCalendarState();
}

class _AppBarCalendarState extends State<AppBarCalendar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton.textAndDownArrow(context, "October"),
        const Spacer(),
        _buildMenu(),
      ],
    );
  }

  Widget _buildMenu() {
    return IconButton(
      icon: const Icon(IconsaxOutline.calendar_1),
      onPressed: () {},
    );
  }
}
