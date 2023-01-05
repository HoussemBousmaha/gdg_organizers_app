import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/shared/icon_broken.dart';

import '../shared/components/task_widget.dart';
import '../shared/const.dart';

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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              // just a static widget
              return TaskWidget();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
