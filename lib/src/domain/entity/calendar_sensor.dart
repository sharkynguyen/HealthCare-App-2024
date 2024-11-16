import 'package:json_annotation/json_annotation.dart';

part 'calendar_sensor.g.dart';

@JsonSerializable()
class CalendarSensor {
  String? id;
  String? name;
  String? description;
  int? heart;
  int? oxygen;
  @JsonKey(name: 'updated_time')
  String? updatedTime;

  CalendarSensor(
      {this.id,
      this.name,
      this.description,
      this.heart,
      this.oxygen,
      this.updatedTime});

  factory CalendarSensor.fromJson(Map<String, dynamic> json) =>
      _$CalendarSensorFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarSensorToJson(this);
}
