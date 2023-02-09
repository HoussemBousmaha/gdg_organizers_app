import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/services/authapi.dart';
import '../models/task.dart';
import '../services/tasksapi.dart';

part 'task_state.dart';
part 'task_cubit.freezed.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState.initial());

  void getTasks() async {
    emit(const TaskState.loading());
    try {
      final String? token = await AuthRepo.getToken();
      if (token == null) {
        emit(const TaskState.initial());
        return;
      }

      final tasks = await TaskApi.getTasks(token);
      if (tasks.isEmpty) {
        emit(const TaskState.error('No tasks found'));
        return;
      } else {
        final doneTasks = tasks.where((element) => element.state  == 'completed').toList();
        final newTasks = tasks.where((element) => element.state  != 'completed').toList();
        emit(TaskState.loaded(doneTasks , newTasks));
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }
}
