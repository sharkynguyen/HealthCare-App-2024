import 'dart:io';
import 'package:logger/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  static const String server = 'mqtt3.thingspeak.com';
  static const String clientID = 'JTIkHDM5OA8GIT0pMzABMRY';

  final client = MqttServerClient(server, clientID);

  var pongCount = 0;
  var pingCount = 0;

  @action
  Future<void> configMqqtClient() async {
    client.port = 8883;

    // Configure client settings
    client.secure = true;
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.setProtocolV311();

    client.connectTimeoutPeriod = 2000;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;
    client.pingCallback = ping;

    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientID)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    Logger().d('Connecting to MQTT broker....');

    client.connectionMessage = connMess;

    try {
      await client.connect(
          'JTIkHDM5OA8GIT0pMzABMRY', 'V2Sz8BNkVQU38V2gqcKeG7w2');

      Logger().d('Connected successfully to MQTT broker');
    } on NoConnectionException catch (e) {
      Logger().d('Client exception - $e');
      client.disconnect();
      return;
    } on SocketException catch (e) {
      Logger().d('Socket exception - $e');
      client.disconnect();
      return;
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      Logger().d('Client connected');

      // Subscribe to the topic
      const topic = 'beat/spo2';
      client.subscribe(topic, MqttQos.atLeastOnce);

      // Listen for updates
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        Logger().d('Notification:: topic <${c[0].topic}>, payload <-- $pt -->');
      });
    }
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    Logger().d('Subscription confirmed for topic $topic');
  }

  void onDisconnected() {
    Logger().d('OnDisconnected client callback - Client disconnection');
  }

  void onConnected() {
    Logger()
        .d('OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    Logger().d('Ping response client callback invoked');
    pongCount++;
  }

  /// Ping callback
  void ping() {
    Logger().d('Ping sent client callback invoked');
    pingCount++;
  }
}
