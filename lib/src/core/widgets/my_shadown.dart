import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';

class MyShadow extends StatelessWidget {
  final Widget child;
  const MyShadow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: colorScheme(context).outlineVariant.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ]),
    );
  }
}
