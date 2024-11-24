import 'package:json_annotation/json_annotation.dart';

part 'personal_info.g.dart';

@JsonSerializable()
class PersonalInfo {
  String? id;
  String? age;
  String? gender;
  String? heartDesease;
  String? otherDease;
  double? heart;
  double? oxygen;
  double? weight;
  double? height;
  bool? isPlayingSports;
  String? sport;

  PersonalInfo({
    this.id,
    this.age,
    this.gender,
    this.heartDesease,
    this.otherDease,
    this.heart,
    this.oxygen,
    this.weight,
    this.height,
    this.isPlayingSports,
    this.sport,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}
