// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarSensor _$CalendarSensorFromJson(Map<String, dynamic> json) =>
    CalendarSensor(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      heart: (json['heart'] as num?)?.toInt(),
      oxygen: (json['oxygen'] as num?)?.toInt(),
      updatedTime: json['updated_time'] as String?,
    );

Map<String, dynamic> _$CalendarSensorToJson(CalendarSensor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'heart': instance.heart,
      'oxygen': instance.oxygen,
      'updated_time': instance.updatedTime,
    };
