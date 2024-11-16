// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnalyticsStore on _AnalyticsStore, Store {
  late final _$advicesAtom =
      Atom(name: '_AnalyticsStore.advices', context: context);

  @override
  ObservableList<HealthAdvice> get advices {
    _$advicesAtom.reportRead();
    return super.advices;
  }

  @override
  set advices(ObservableList<HealthAdvice> value) {
    _$advicesAtom.reportWrite(value, super.advices, () {
      super.advices = value;
    });
  }

  late final _$fetchAdviceDataAsyncAction =
      AsyncAction('_AnalyticsStore.fetchAdviceData', context: context);

  @override
  Future<void> fetchAdviceData() {
    return _$fetchAdviceDataAsyncAction.run(() => super.fetchAdviceData());
  }

  @override
  String toString() {
    return '''
advices: ${advices}
    ''';
  }
}
