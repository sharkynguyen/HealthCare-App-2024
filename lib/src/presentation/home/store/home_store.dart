import 'dart:convert';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  double heartRate = 0.0;

  @observable
  double humidity = 0.0;

  @action
  void updateHeartRate(double value) {
    heartRate = value;
  }

  @action
  void updateHumidity(double value) {
    humidity = value;
  }

  @action
  Future<void> scanAndConnect() async {
    Logger().d("Scanning for ESP32_HeartSensor...");

    // Bắt đầu quét thiết bị trong 10 giây
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) async {
      for (var r in results) {
        Logger().d('Found device: ${r.device.platformName} (${r.device.id})');
        if (r.device.platformName == 'ESP32_HeartSensor') {
          Logger().d('Found ESP32_HeartSensor, connecting...');
          FlutterBluePlus.stopScan();
          await connectToDevice(r.device);
          break;
        }
      }
    });
  }

  @action
  Future<void> connectToDevice(BluetoothDevice device) async {
    Logger().d('Connecting to ${device.platformName}...');
    await device.connect();
    Logger().d('Connected to ${device.platformName}');

    // Bắt đầu lắng nghe dữ liệu từ thiết bị
    await listenToDevice(device);
  }

  @action
  Future<void> listenToDevice(BluetoothDevice device) async {
    Logger().d("Listening to ${device.platformName}...");

    List<BluetoothService> services = await device.discoverServices();
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.value.listen((value) {
            _handleData(value);
          });
        }
      }
    }
  }

  void _handleData(List<int> value) {
    String data = utf8.decode(value);
    Logger().d("Received: $data");

    try {
      RegExp regExp = RegExp(r"HR:\s*([\d.]+)\s*bpm,\s*SpO2:\s*([\d.]+)\s*%");
      var match = regExp.firstMatch(data);

      if (match != null) {
        double heartRate = double.parse(match.group(1)!);
        double spo2 = double.parse(match.group(2)!);

        Logger().d("Parsed -> Heart Rate: $heartRate bpm, SpO2: $spo2%");
        updateHeartRate(heartRate);
        updateHumidity(spo2);
      } else {
        Logger().d("Invalid data format: $data");
      }
    } catch (e) {
      Logger().d("Error parsing data: $e");
    }
  }
}
