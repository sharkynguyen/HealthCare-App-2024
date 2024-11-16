import 'dart:async';
import 'dart:convert';

import 'package:health_care_app/src/domain/entity/stream_sensor.dart';
import 'package:health_care_app/src/domain/repository/adafruit_repository.dart';
import 'package:logger/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class AdafruitRepositoryImpl extends AdafruitRepository {
  late MqttServerClient _client;

  final String userName = 'sharkynguyen';
  final String apiKey = 'aio_QSHH52yLQ9ZXNlQCdui5l1rt8t5g';

  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>?
      _listenSensorSubscription;

  final StreamController<StreamSensor> _streamSensorController =
      StreamController.broadcast();

  @override
  Future<MqttServerClient> connectToAdafruitServer() async {
    _client = MqttServerClient('io.adafruit.com', '');

    _client
      ..logging(on: true)
      ..setProtocolV311()
      ..keepAlivePeriod = 20
      ..port = 1883
      ..secure = false
      ..useWebSocket = false
      ..onConnected = onConnected
      ..onDisconnected = onDisconnected
      ..connectionMessage = MqttConnectMessage()
          .authenticateAs(userName, apiKey)
          .startClean()
          .withWillTopic('willtopic')
          .withWillMessage('Adafruit connection closed unexpectedly')
          .withWillQos(MqttQos.atLeastOnce);
    await _client.connect();

    return _client;
  }

  void onConnected() {
    Logger().d('Connected to Adafruit IO');
    _subscribeToFeed('temperature');
    _subscribeToFeed('humidity');
  }

  void onDisconnected() => Logger().d('Disconnected from Adafruit IO');

  void _subscribeToFeed(String feedKey) {
    final topic = '$userName/feeds/$feedKey';

    _client.subscribe(topic, MqttQos.atLeastOnce);

    _listenSensorSubscription =
        _client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> event) {
      for (var message in event) {
        final payload = message.payload as MqttPublishMessage;
        final updatedData = utf8.decode(payload.payload.message);

        final streamSensorModel =
            StreamSensor(topic: message.topic, updatedData: updatedData);

        _streamSensorController.add(streamSensorModel);

        Logger().f(
            'Received data from ${streamSensorModel.topic!.split('/').last}: $updatedData');
      }
    });
  }

  @override
  void close() {
    _listenSensorSubscription?.cancel();
    _streamSensorController.close();
  }

  @override
  Stream<StreamSensor> get streamSensor => _streamSensorController.stream;
}
