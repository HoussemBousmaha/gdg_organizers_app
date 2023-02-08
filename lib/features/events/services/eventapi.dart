import 'package:gdg_organizers_app/shared/services/diohelper.dart';

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
}