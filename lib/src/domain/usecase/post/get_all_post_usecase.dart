import 'dart:async';

import 'package:health_care_app/src/core/domain/usecases/use_case.dart';
import 'package:health_care_app/src/domain/repository/post_repository.dart';

class GetAllPostUsecase implements UseCase {
  final PostRepository _postRepository;

  GetAllPostUsecase(this._postRepository);

  @override
  FutureOr call({required params}) {
    return _postRepository.getAllSortedByFilter();
  }
}
