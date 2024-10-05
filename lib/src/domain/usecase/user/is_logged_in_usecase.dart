import 'package:health_care_app/src/core/domain/usecases/use_case.dart';
import 'package:health_care_app/src/domain/repository/user_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, void> {
  final UserRepository _userRepository;

  IsLoggedInUseCase(this._userRepository);

  @override
  Future<bool> call({required void params}) async {
    return await _userRepository.isLoggedIn;
  }
}
