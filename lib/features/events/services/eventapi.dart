import '../../../models/comments/comment.dart';
import '../../../shared/services/diohelper.dart';
import '../models/event.dart';

class EventApi {
  static Future<List<Event>> getEvents(String token) async {
    final res = await DioHelper.getData(url: '/event/all', token: token);
    print(res.statusCode);
    if (res.statusCode == 200) {
      final events = res.data['events'] as List;
      return events.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception(res.data['message'] ?? 'Something went wrong');
    }
  }

  static Future<List<Comment>> getComments(String token, String threadID) async {
    final res = await DioHelper.getData(url: '/comment/all', query: {'threadID': threadID}, token: token);
    if (res.statusCode == 200) {
      final comments = res.data['thread']['comments'] as List;
      return comments.map((e) => Comment.fromJson(e)).toList();
    } else {
      throw Exception(res.data['message'] ?? 'Something went wrong');
    }
  }
}
