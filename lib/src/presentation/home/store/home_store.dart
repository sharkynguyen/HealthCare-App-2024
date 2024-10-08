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

    client.keepAlivePeriod = 20;
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

    Logger().d('EXAMPLE::Mosquitto client connecting....');

    client.connectionMessage = connMess;

    try {
      await client.connect(
          'JTIkHDM5OA8GIT0pMzABMRY', 'V2Sz8BNkVQU38V2gqcKeG7w2');

      Logger().d('Connected successfully to MQTT broker');
    } on NoConnectionException catch (e) {
      Logger().d('EXAMPLE::client exception - $e');

      client.disconnect();
    } on SocketException catch (e) {
      Logger().d('EXAMPLE::socket exception - $e');

      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      Logger().d('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      Logger().d(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
    }

    /// Ok, lets try a subscription
    Logger().d('EXAMPLE::Subscribing to the test/lol topic');
    // const topic = 'test/lol'; // Not a wildcard topic
    // client.subscribe(topic, MqttQos.atMostOnce);

    // client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    //   final recMess = c![0].payload as MqttPublishMessage;
    //   final pt =
    //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    //   Logger().d(
    //       'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
    //   Logger().d('');
    // });

    // client.published!.listen((MqttPublishMessage message) {
    //   Logger().d(
    //       'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    // });

    // const pubTopic = 'Dart/Mqtt_client/testtopic';
    // final builder = MqttClientPayloadBuilder();
    // builder.addString('Hello from mqtt_client');

    // /// Subscribe to it
    // Logger().d('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
    // client.subscribe(pubTopic, MqttQos.exactlyOnce);

    // /// Publish it
    // Logger().d('EXAMPLE::Publishing our topic');
    // client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

    // Logger().d('EXAMPLE::Sleeping....');
    // await MqttUtilities.asyncSleep(60);

    // /// Logger().d the ping/pong cycle latency data before disconnecting.
    // Logger().d('EXAMPLE::Keep alive latencies');
    // Logger().d(
    //     'The latency of the last ping/pong cycle is ${client.lastCycleLatency} milliseconds');
    // Logger().d(
    //     'The average latency of all the ping/pong cycles is ${client.averageCycleLatency} milliseconds');

    // /// Finally, unsubscribe and exit gracefully
    // Logger().d('EXAMPLE::Unsubscribing');
    // client.unsubscribe(topic);

    // /// Wait for the unsubscribe message from the broker if you wish.
    // await MqttUtilities.asyncSleep(2);
    // Logger().d('EXAMPLE::Disconnecting');
    client.disconnect();
    // Logger().d('EXAMPLE::Exiting normally');
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    Logger().d('EXAMPLE::Subscription confirmed for topic $topic');
  }

  void onDisconnected() {
    Logger()
        .d('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      Logger()
          .d('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    } else {
      Logger().d(
          'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    }
    if (pongCount == 3) {
      Logger().d('EXAMPLE:: Pong count is correct');
    } else {
      Logger().d(
          'EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
    }
    if (pingCount == 3) {
      Logger().d('EXAMPLE:: Ping count is correct');
    } else {
      Logger().d(
          'EXAMPLE:: Ping count is incorrect, expected 3. actual $pingCount');
    }
  }

  void onConnected() {
    Logger().d(
        'EXAMPLE::OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    Logger().d('EXAMPLE::Ping response client callback invoked');
    pongCount++;
    Logger().d(
        'EXAMPLE::Latency of this ping/pong cycle is ${client.lastCycleLatency} milliseconds');
  }

  /// Ping callback
  void ping() {
    Logger().d('EXAMPLE::Ping sent client callback invoked');
    pingCount++;
  }
}
