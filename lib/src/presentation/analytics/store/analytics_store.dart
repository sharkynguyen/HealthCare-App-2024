import 'package:health_care_app/src/domain/entity/health_advice.dart';
import 'package:health_care_app/src/domain/repository/analytics_repository.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'analytics_store.g.dart';

class AnalyticsStore = _AnalyticsStore with _$AnalyticsStore;

abstract class _AnalyticsStore with Store {
  final AnalyticsRepository _analyticsRepository;

  _AnalyticsStore(this._analyticsRepository) {
    fetchAdviceData();
  }

  @observable
  ObservableList<HealthAdvice> advices = ObservableList<HealthAdvice>();

  @action
  Future<void> fetchAdviceData() async {
    try {
      final data = await _analyticsRepository.getHealthAdvices();
      advices = ObservableList.of(data);
    } catch (e) {
      Logger().d("Error fetching sensor data: $e");
    }
  }
}
