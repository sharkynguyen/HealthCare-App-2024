import 'package:health_care_app/src/core/domain/usecases/use_case.dart';
import 'package:health_care_app/src/domain/repository/user_repository.dart';

class SaveLoginStatusUseCase implements UseCase<void, bool> {
  final UserRepository _userRepository;

  SaveLoginStatusUseCase(this._userRepository);

  @override
  Future<void> call({required bool params}) async {
    return _userRepository.saveIsLoggedIn(params);
  }
}
