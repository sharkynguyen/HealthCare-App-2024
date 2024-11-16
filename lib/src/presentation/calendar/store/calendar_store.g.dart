// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarStore on _CalendarStore, Store {
  late final _$sensorDataAtom =
      Atom(name: '_CalendarStore.sensorData', context: context);

  @override
  ObservableList<CalendarSensor> get sensorData {
    _$sensorDataAtom.reportRead();
    return super.sensorData;
  }

  @override
  set sensorData(ObservableList<CalendarSensor> value) {
    _$sensorDataAtom.reportWrite(value, super.sensorData, () {
      super.sensorData = value;
    });
  }

  late final _$fetchSensorDataAsyncAction =
      AsyncAction('_CalendarStore.fetchSensorData', context: context);

  @override
  Future<void> fetchSensorData() {
    return _$fetchSensorDataAsyncAction.run(() => super.fetchSensorData());
  }

  @override
  String toString() {
    return '''
sensorData: ${sensorData}
    ''';
  }
}
