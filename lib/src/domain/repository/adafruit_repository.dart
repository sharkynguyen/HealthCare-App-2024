import 'dart:async';

import 'package:health_care_app/src/domain/entity/stream_sensor.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

abstract class AdafruitRepository {
  Future<MqttServerClient> connectToAdafruitServer();

  void close();

  Stream<StreamSensor> get streamSensor;
}
