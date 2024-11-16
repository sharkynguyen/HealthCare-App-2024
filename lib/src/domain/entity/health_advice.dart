import 'package:json_annotation/json_annotation.dart';

part 'health_advice.g.dart';

@JsonSerializable()
class HealthAdvice {
  String? id;
  String? msg;
  double? heart;
  double? oxygen;
  @JsonKey(name: 'updated_time')
  String? updatedTime;

  HealthAdvice({
    this.id,
    this.msg,
    this.heart,
    this.oxygen,
    this.updatedTime,
  });

  factory HealthAdvice.fromJson(Map<String, dynamic> json) =>
      _$HealthAdviceFromJson(json);

  Map<String, dynamic> toJson() => _$HealthAdviceToJson(this);
}
