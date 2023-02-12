import '../../shared/services/diohelper.dart';

import 'models/post.dart';

class PostApi {
  static Future<List<Post>> getPosts(String token) async {
    try {
      final res = await DioHelper.getData(url: '/post/all', token: token);
      if (res.statusCode == 200) {
        final posts = res.data['posts'] as List;
        return posts.map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception(res.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }
}
