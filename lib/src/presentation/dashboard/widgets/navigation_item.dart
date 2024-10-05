import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';

class MyNavigationItem extends StatelessWidget {
  final IconData iconData;
  final IconData selectedIconData;
  final String label;

  const MyNavigationItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.selectedIconData,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        iconData,
        color: colorScheme(context).outline,
      ),
      selectedIcon: Icon(
        selectedIconData,
        color: colorScheme(context).surface,
      ),
      label: label,
    );
  }
}
