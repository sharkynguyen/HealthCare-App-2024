import 'dart:async';

import 'package:health_care_app/src/data/datasource/post_datasource.dart';
import 'package:health_care_app/src/domain/entity/post.dart';
import 'package:health_care_app/src/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  // data source object
  final PostDataSource _postDataSource;

  // constructor
  PostRepositoryImpl(this._postDataSource);

  // Post: ---------------------------------------------------------------------
  // @override
  // Future<PostList> getPosts() async {
  //   return await _postApi.getPosts().then((postsList) {
  //     postsList.posts?.forEach((post) {
  //       _postDataSource.insert(post);
  //     });

  //     return postsList;
  //   }).catchError((error) => throw error);
  // }

  @override
  Future<List<Post>> getAllSortedByFilter() async {
    return [];
  }

  @override
  Future<int> delete(Post post) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  // @override
  // Future<int> update(Post post) => _postDataSource
  //     .update(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);
}
