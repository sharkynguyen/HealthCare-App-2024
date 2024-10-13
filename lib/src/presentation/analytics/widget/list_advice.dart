import 'package:flutter/material.dart';
import 'package:health_care_app/src/presentation/analytics/widget/advice_item.dart';

class ListAdvice extends StatelessWidget {
  const ListAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) => const AdviceItem()),
    );
  }
}
