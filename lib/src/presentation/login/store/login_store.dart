import 'package:health_care_app/src/core/stores/error_store.dart';
import 'package:health_care_app/src/core/stores/form_store.dart';
import 'package:health_care_app/src/domain/entity/use.dart';
import 'package:health_care_app/src/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:health_care_app/src/domain/usecase/user/save_login_status_usecase.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import '../../../domain/usecase/user/login_usecase.dart';

part 'login_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(
    this._isLoggedInUseCase,
    this._saveLoginStatusUseCase,
    this._loginUseCase,
    this.formErrorStore,
    this.errorStore,
  ) {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
  }

  // use cases:-----------------------------------------------------------------
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final LoginUseCase _loginUseCase;

  // stores:--------------------------------------------------------------------
  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<User?> emptyLoginResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  bool isLoggedIn = false;

  @observable
  bool success = false;

  @observable
  ObservableFuture<User?> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    final LoginParams loginParams =
        LoginParams(username: email, password: password);
    final future = _loginUseCase.call(params: loginParams);
    loginFuture = ObservableFuture(future);

    await future.then((value) async {
      if (value != null) {
        await _saveLoginStatusUseCase.call(params: true);
        isLoggedIn = true;
        success = true;
      }
    }).catchError((e) {
      Logger().d(e);
      isLoggedIn = false;
      success = false;
      throw e;
    });
  }

  logout() async {
    isLoggedIn = false;
    await _saveLoginStatusUseCase.call(params: false);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
