// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingStore on _SettingStore, Store {
  late final _$heartRateAtom =
      Atom(name: '_SettingStore.heartRate', context: context);

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

  late final _$oxygenAtom =
      Atom(name: '_SettingStore.oxygen', context: context);

  @override
  double get oxygen {
    _$oxygenAtom.reportRead();
    return super.oxygen;
  }

  @override
  set oxygen(double value) {
    _$oxygenAtom.reportWrite(value, super.oxygen, () {
      super.oxygen = value;
    });
  }

  late final _$isConnectedAtom =
      Atom(name: '_SettingStore.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SettingStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$personalInfoAtom =
      Atom(name: '_SettingStore.personalInfo', context: context);

  @override
  ObservableList<PersonalInfo> get personalInfo {
    _$personalInfoAtom.reportRead();
    return super.personalInfo;
  }

  @override
  set personalInfo(ObservableList<PersonalInfo> value) {
    _$personalInfoAtom.reportWrite(value, super.personalInfo, () {
      super.personalInfo = value;
    });
  }

  late final _$fetchPersonInfoAsyncAction =
      AsyncAction('_SettingStore.fetchPersonInfo', context: context);

  @override
  Future<void> fetchPersonInfo() {
    return _$fetchPersonInfoAsyncAction.run(() => super.fetchPersonInfo());
  }

  late final _$updatePersonInfoAsyncAction =
      AsyncAction('_SettingStore.updatePersonInfo', context: context);

  @override
  Future<void> updatePersonInfo(PersonalInfo info) {
    return _$updatePersonInfoAsyncAction
        .run(() => super.updatePersonInfo(info));
  }

  late final _$connectToAdafruitAsyncAction =
      AsyncAction('_SettingStore.connectToAdafruit', context: context);

  @override
  Future<void> connectToAdafruit() {
    return _$connectToAdafruitAsyncAction.run(() => super.connectToAdafruit());
  }

  late final _$_SettingStoreActionController =
      ActionController(name: '_SettingStore', context: context);

  @override
  void disconnect() {
    final _$actionInfo = _$_SettingStoreActionController.startAction(
        name: '_SettingStore.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_SettingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heartRate: ${heartRate},
oxygen: ${oxygen},
isConnected: ${isConnected},
errorMessage: ${errorMessage},
personalInfo: ${personalInfo}
    ''';
  }
}
