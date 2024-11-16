import 'package:json_annotation/json_annotation.dart';

part 'stream_sensor.g.dart';

@JsonSerializable()
class StreamSensor {
  String? topic;
  String? updatedData;

  StreamSensor({this.topic, this.updatedData});

  factory StreamSensor.fromJson(Map<String, dynamic> json) =>
      _$StreamSensorFromJson(json);

  Map<String, dynamic> toJson() => _$StreamSensorToJson(this);
}
