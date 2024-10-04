import 'dart:async';

import 'package:health_care_app/src/domain/entity/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllSortedByFilter();

  Future<int> delete(Post post);
}
