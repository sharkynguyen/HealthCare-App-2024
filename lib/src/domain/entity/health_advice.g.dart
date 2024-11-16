// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthAdvice _$HealthAdviceFromJson(Map<String, dynamic> json) => HealthAdvice(
      id: json['id'] as String?,
      msg: json['msg'] as String?,
      heart: (json['heart'] as num?)?.toDouble(),
      oxygen: (json['oxygen'] as num?)?.toDouble(),
      updatedTime: json['updated_time'] as String?,
    );

Map<String, dynamic> _$HealthAdviceToJson(HealthAdvice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
      'heart': instance.heart,
      'oxygen': instance.oxygen,
      'updated_time': instance.updatedTime,
    };
