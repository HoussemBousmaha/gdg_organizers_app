import '../../../shared/services/diohelper.dart';
import '../models/task.dart';

class TaskApi {
  static Future<List<Task>> getTasks(String token) async {
    final res = await DioHelper.getData(url: '/task/user/:id', token: token);
    try {
      if (res.statusCode == 200) {
        final tasks = res.data['tasks'] as List;
        return tasks.map((e) => Task.fromJson(e)).toList();
      } else {
        throw Exception(res.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e);
      throw Exception(res.data['message'] ?? 'Something went wrong');
    }
  }
}
