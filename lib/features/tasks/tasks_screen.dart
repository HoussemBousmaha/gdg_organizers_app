import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/const.dart';
import '../../logic/togglecubit.dart';
import 'models/task.dart';
import 'task_cubit/task_cubit.dart';

part 'widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TaskCubit>().getTasks();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 15),
              child: Text(
                'New Tasks',
                style: TextStyle(
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Column(
                    children: List.generate(2, (index) => const TaskShimmer()),
                  ),
                  loaded: (_, tasks) => Column(children: tasks.map((e) => TaskWidget(task: e)).toList()),
                  error: (e) => Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 15),
              child: Text(
                'Done Tasks',
                style: TextStyle(
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Column(
                    children: List.generate(2, (index) => const TaskShimmer()),
                  ),
                  loaded: (doneTasks, _) => Column(children: doneTasks.map((e) => TaskWidget(task: e)).toList()),
                  error: (e) => Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
