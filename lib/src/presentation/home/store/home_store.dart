import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:health_care_app/src/domain/entity/personal_info.dart';
import 'package:health_care_app/src/domain/entity/stream_sensor.dart';
import 'package:health_care_app/src/domain/repository/adafruit_repository.dart';
import 'package:health_care_app/src/domain/repository/advice_repository.dart';
import 'package:health_care_app/src/domain/repository/personal_repository.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final AdafruitRepository _adafruitRepository;
  final AdviceRepository _adviceRepository;
  final PersonalRepository _personalRepository;

  _HomeStore(
    this._adafruitRepository,
    this._adviceRepository,
    this._personalRepository,
  ) {
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
  String aiGeneratedContent = '';

  @observable
  ObservableList<PersonalInfo> personalInfo = ObservableList<PersonalInfo>();

  void _init() {
    fetchPersonInfo();
    connectToAdafruit();
  }

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

  void _subscribeToSensorStream() {
    _adafruitRepository.streamSensor.listen((StreamSensor sensorData) async {
      final feedKey = sensorData.topic!.split('/').last;

      switch (feedKey) {
        case 'temperature':
          heartRate = double.tryParse(sensorData.updatedData!) ?? 0.0;
          break;
        case 'humidity':
          oxygen = double.tryParse(sensorData.updatedData!) ?? 0.0;
          break;
      }

      final prompt = 'I need health advice, no more than 10 words. '
          'Do not refer to it as a value I sent. '
          'Simply provide my health status based on the following information: '
          'heart rate is $heartRate, oxygen level is $oxygen. '
          'My personal health profile is as follows: '
          ' Age: ${personalInfo.first.age}, Gender: ${personalInfo.first.gender}, '
          'Heart Disease: ${personalInfo.first.heartDesease}, Other Diseases: ${personalInfo.first.otherDease}, '
          'Heart Rate: ${personalInfo.first.heart}, Oxygen Level: ${personalInfo.first.oxygen}, '
          'Weight: ${personalInfo.first.weight}, Height: ${personalInfo.first.height}, '
          'Plays Sports: ${personalInfo.first.isPlayingSports}, Sport: ${personalInfo.first.sport}.';

      generateAIContent(prompt);

      Logger().d('calll');
    });
  }

  Future<void> generateAIContent(String prompt) async {
    try {
      final geminiInstance = Gemini.instance;

      aiGeneratedContent = '';

      geminiInstance.streamGenerateContent(prompt).listen(
        (generatedContent) {
          aiGeneratedContent = generatedContent.output ?? ' ';

          Logger().d(generatedContent);
        },
        onError: (e) {
          errorMessage = e.toString();
        },
      ).onDone(() async => _onGeneredDone());
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  void disconnect() {
    _adafruitRepository.close();
    isConnected = false;
  }

  Future<void> _onGeneredDone() async {
    Logger().d('AI content generation completed');

    await _adviceRepository.updateLastestAdvice(
      msg: aiGeneratedContent,
      heart: heartRate,
      oxygen: oxygen,
      updatedTime: DateFormat('MM/dd/yyyy, HH:mm:ss').format(DateTime.now()),
    );
  }
}
