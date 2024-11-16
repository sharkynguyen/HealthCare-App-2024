// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamSensor _$StreamSensorFromJson(Map<String, dynamic> json) => StreamSensor(
      topic: json['topic'] as String?,
      updatedData: json['updatedData'] as String?,
    );

Map<String, dynamic> _$StreamSensorToJson(StreamSensor instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'updatedData': instance.updatedData,
    };
