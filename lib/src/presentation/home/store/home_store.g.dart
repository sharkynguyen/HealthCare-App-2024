// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$heartRateAtom =
      Atom(name: '_HomeStore.heartRate', context: context);

  @override
  double get heartRate {
    _$heartRateAtom.reportRead();
    return super.heartRate;
  }

  @override
  set heartRate(double value) {
    _$heartRateAtom.reportWrite(value, super.heartRate, () {
      super.heartRate = value;
    });
  }

  late final _$humidityAtom =
      Atom(name: '_HomeStore.humidity', context: context);

  @override
  double get humidity {
    _$humidityAtom.reportRead();
    return super.humidity;
  }

  @override
  set humidity(double value) {
    _$humidityAtom.reportWrite(value, super.humidity, () {
      super.humidity = value;
    });
  }

  late final _$scanAndConnectAsyncAction =
      AsyncAction('_HomeStore.scanAndConnect', context: context);

  @override
  Future<void> scanAndConnect() {
    return _$scanAndConnectAsyncAction.run(() => super.scanAndConnect());
  }

  late final _$connectToDeviceAsyncAction =
      AsyncAction('_HomeStore.connectToDevice', context: context);

  @override
  Future<void> connectToDevice(BluetoothDevice device) {
    return _$connectToDeviceAsyncAction
        .run(() => super.connectToDevice(device));
  }

  late final _$listenToDeviceAsyncAction =
      AsyncAction('_HomeStore.listenToDevice', context: context);

  @override
  Future<void> listenToDevice(BluetoothDevice device) {
    return _$listenToDeviceAsyncAction.run(() => super.listenToDevice(device));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void updateHeartRate(double value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.updateHeartRate');
    try {
      return super.updateHeartRate(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateHumidity(double value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.updateHumidity');
    try {
      return super.updateHumidity(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heartRate: ${heartRate},
humidity: ${humidity}
    ''';
  }
}
