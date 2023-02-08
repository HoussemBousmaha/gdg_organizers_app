import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/features/tasks/task_cubit/task_cubit.dart';
import 'package:gdg_organizers_app/logic/togglecubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/const.dart';

part 'widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 15,
            ),
            child: Text(
              'New Tasks',
              style: TextStyle(
                color: Color(0xFF4285F4),
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Column(
                        children: List.generate(10, (index) => TaskShimmer()),
                      ),
                  loaded: (_, tasks) => Column(
                      children: tasks
                          .map((e) => TaskWidget(
                                title: e.name,
                                time: e.date_debut!,
                              ))
                          .toList()),
                  error: (e) => Center(child: Text(e)));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 15,
            ),
            child: Text(
              'Done Tasks',
              style: TextStyle(
                color: Color(0xFF4285F4),
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Column(
                        children: List.generate(10, (index) => TaskShimmer()),
                      ),
                  loaded: (doneTasks, _) => Column(
                      children: doneTasks
                          .map((e) => TaskWidget(
                                title: e.name,
                                time: e.date_debut!,
                              ))
                          .toList()),
                  error: (e) => Center(child: Text(e)));
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
