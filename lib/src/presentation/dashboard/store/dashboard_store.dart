import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

const INIT_BOTTOM_BAR_INDEX = 0;

abstract class _DashboardStore with Store {
  @observable
  int selectedTabIndex = INIT_BOTTOM_BAR_INDEX;

  @action
  void changeSelectedIndex(int updatedIndex) {
    selectedTabIndex = updatedIndex;
  }
}
