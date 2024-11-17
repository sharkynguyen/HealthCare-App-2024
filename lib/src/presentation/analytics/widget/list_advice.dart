import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/analytics/store/analytics_store.dart';
import 'package:health_care_app/src/presentation/analytics/widget/advice_item.dart';

class ListAdvice extends StatefulWidget {
  const ListAdvice({super.key});

  @override
  State<ListAdvice> createState() => _ListAdviceState();
}

class _ListAdviceState extends State<ListAdvice> {
  final _analyticsStore = injector.get<AnalyticsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
            itemCount: _analyticsStore.advices.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) => AdviceItem(
                  advice: _analyticsStore.advices[index].msg!,
                  updatedAt: _analyticsStore.advices[index].updatedTime!,
                ));
      },
    );
  }
}
