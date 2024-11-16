import 'package:health_care_app/src/domain/repository/calendar_repository.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:health_care_app/src/domain/entity/calendar_sensor.dart';

part 'calendar_store.g.dart';

class CalendarStore = _CalendarStore with _$CalendarStore;

abstract class _CalendarStore with Store {
  final CalendarRepository _calendarRepository;

  _CalendarStore(this._calendarRepository) {
    fetchSensorData();
  }

  @observable
  ObservableList<CalendarSensor> sensorData = ObservableList<CalendarSensor>();

  @action
  Future<void> fetchSensorData() async {
    try {
      final data = await _calendarRepository.getListSensorData();
      sensorData = ObservableList.of(data);
    } catch (e) {
      Logger().d("Error fetching sensor data: $e");
    }
  }
}
