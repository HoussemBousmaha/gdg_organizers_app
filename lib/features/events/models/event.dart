import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user/user.dart';
import '../../tasks/models/task.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    String? id,
    required String name,
    required String description,
    required String image,
    List<User>? organizers,
    List<Task>? tasks,
    String? datedebut,
    String? datefin,
    @Default('inactive') String? state,
    String? thread,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
