import 'package:health_care_app/src/domain/entity/post.dart';

class PostDataSource {
  Future<List<Post>> getAllSortedByFilter() async {
    // //creating finder
    // final finder = Finder(
    //     filter: filters != null ? Filter.and(filters) : null,
    //     sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    // final recordSnapshots = await _postsStore.find(
    //   _sembastClient.database,
    //   finder: finder,
    // );

    // // Making a List<Post> out of List<RecordSnapshot>
    // return recordSnapshots.map((snapshot) {
    //   final post = Post.fromMap(snapshot.value);
    //   // An ID is a key of a record from the database.
    //   post.id = snapshot.key;
    //   return post;
    // }).toList();

    return [];
  }
}
