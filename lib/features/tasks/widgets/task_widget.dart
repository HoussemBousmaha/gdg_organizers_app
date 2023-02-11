part of '../tasks_screen.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        border: Border.all(
          color: kBlue,
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text('${task.datedebut}  ${task.duration}}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: kGrey,
                    )),
              ],
            ),
          ),
          const Spacer(),
          CustomCheckbox(isChecked: task.state == 'completed'),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
  });
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit()..set(isChecked),
      child: BlocBuilder<ToggelCubit, bool>(
        builder: (context, state) {
          return Transform.scale(
            scale: 1.3,
            child: Checkbox(
              side: const BorderSide(
                color: kGrey,
              ),
              value: state,
              onChanged: (value) {
                context.read<ToggelCubit>().toggle();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: kGrey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
                margin: const EdgeInsets.all(15),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                )),
          ),
        ],
      ),
    );
  }
}
