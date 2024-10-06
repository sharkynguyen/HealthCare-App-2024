import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/widgets/my_rounded_button.dart';

class AppBarAnalytics extends StatefulWidget {
  const AppBarAnalytics({super.key});

  @override
  State<AppBarAnalytics> createState() => _AppBarAnalyticsState();
}

class _AppBarAnalyticsState extends State<AppBarAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton.textAndCustomIcon(
          context,
          "Good",
          IconsaxOutline.tick_circle,
        ),
        const Spacer(),
        _buildMenu(),
      ],
    );
  }

  Widget _buildMenu() {
    return IconButton(
      icon: const Icon(IconsaxOutline.check),
      onPressed: () {},
    );
  }
}
