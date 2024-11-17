import 'package:health_care_app/src/domain/entity/personal_info.dart';
import 'package:health_care_app/src/domain/entity/stream_sensor.dart';
import 'package:health_care_app/src/domain/repository/adafruit_repository.dart';
import 'package:health_care_app/src/domain/repository/personal_repository.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'setting_store.g.dart';

class SettingStore = _SettingStore with _$SettingStore;

abstract class _SettingStore with Store {
  final AdafruitRepository _adafruitRepository;
  final PersonalRepository _personalRepository;

  _SettingStore(this._adafruitRepository, this._personalRepository) {
    _init();
  }

  @observable
  double heartRate = 0.0;

  @observable
  double oxygen = 0.0;

  @observable
  bool isConnected = false;

  @observable
  String errorMessage = '';

  @observable
  ObservableList<PersonalInfo> personalInfo = ObservableList<PersonalInfo>();

  @action
  Future<void> fetchPersonInfo() async {
    try {
      final data = await _personalRepository.getPersonInfo();
      personalInfo = ObservableList.of(data);
    } catch (e) {
      Logger().d("Error fetching sensor data: $e");
    }
  }

  @action
  Future<void> updatePersonInfo(PersonalInfo info) async {
    try {
      await _personalRepository.updatePersonInfo(info);
    } catch (e) {
      Logger().d("Error fetching sensor data: $e");
    }
  }

  @action
  Future<void> connectToAdafruit() async {
    try {
      await _adafruitRepository.connectToAdafruitServer();
      isConnected = true;

      _subscribeToSensorStream();
    } catch (e) {
      isConnected = false;
      errorMessage = e.toString();
    }
  }

  void _init() {
    connectToAdafruit();
    fetchPersonInfo();
  }

  void _subscribeToSensorStream() {
    _adafruitRepository.streamSensor.listen((StreamSensor sensorData) {
      final feedKey = sensorData.topic!.split('/').last;

      switch (feedKey) {
        case 'temperature':
          heartRate = double.tryParse(sensorData.updatedData!) ?? 0.0;
          break;
        case 'humidity':
          oxygen = double.tryParse(sensorData.updatedData!) ?? 0.0;
          break;
      }
    });
  }

  @action
  void disconnect() {
    _adafruitRepository.close();
    isConnected = false;
  }
}
