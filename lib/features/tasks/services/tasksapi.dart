import 'package:gdg_organizers_app/features/tasks/models/task.dart';

import '../../../shared/services/diohelper.dart';

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
