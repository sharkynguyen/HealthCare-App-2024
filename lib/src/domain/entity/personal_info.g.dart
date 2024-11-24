// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      id: json['id'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      heartDesease: json['heartDesease'] as String?,
      otherDease: json['otherDease'] as String?,
      heart: (json['heart'] as num?)?.toDouble(),
      oxygen: (json['oxygen'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      isPlayingSports: json['isPlayingSports'] as bool?,
      sport: json['sport'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'gender': instance.gender,
      'heartDesease': instance.heartDesease,
      'otherDease': instance.otherDease,
      'heart': instance.heart,
      'oxygen': instance.oxygen,
      'weight': instance.weight,
      'height': instance.height,
      'isPlayingSports': instance.isPlayingSports,
      'sport': instance.sport,
    };
