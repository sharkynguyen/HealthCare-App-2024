import 'package:health_care_app/src/domain/entity/stream_sensor.dart';
import 'package:health_care_app/src/domain/repository/adafruit_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final AdafruitRepository _adafruitRepository;

  _HomeStore(this._adafruitRepository) {
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
