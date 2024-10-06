import 'package:flutter/material.dart';
import 'package:health_care_app/src/presentation/analytics/widget/advice_item.dart';

class ListAdvice extends StatelessWidget {
  const ListAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const AdviceItem();
        });
  }
}
