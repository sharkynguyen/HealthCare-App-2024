import 'package:health_care_app/src/core/domain/usecases/use_case.dart';
import 'package:health_care_app/src/domain/entity/post.dart';
import 'package:health_care_app/src/domain/repository/post_repository.dart';

class DeletePostUseCase extends UseCase<int, Post> {
  final PostRepository _postRepository;

  DeletePostUseCase(this._postRepository);

  @override
  Future<int> call({required params}) {
    return _postRepository.delete(params);
  }
}
