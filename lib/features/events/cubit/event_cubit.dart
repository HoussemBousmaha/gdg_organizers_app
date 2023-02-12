import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/services/authapi.dart';
import '../models/event.dart';
import '../services/eventapi.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventState.initial());

  void getEvents() async {
    emit(const EventState.loading());
    try {
      final String? token = await AuthRepo.getToken();
      if (token == null) {
        emit(const EventState.initial());
        return;
      } else {
        final events = await EventApi.getEvents(token);
        if (events.isEmpty) {
          emit(const EventState.error('No events found'));
          return;
        } else {
          final newEvents = events.where((element) => element.state == 'Active').toList();
          final soonEvents = events.where((element) => element.state == 'Soon').toList();
          emit(EventState.loaded(newEvents, soonEvents));
        }
      }
    } catch (e) {
      emit(EventState.error(e.toString()));
    }
  }
}
