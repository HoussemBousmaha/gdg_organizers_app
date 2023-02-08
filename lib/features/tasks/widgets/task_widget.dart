
part of '../tasks_screen.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key, required this.title, required this.time}) : super(key: key);
  final String  title ; 
  final String  time ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
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
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: kGrey,
                  )
                ),
              ],
            ),
          ),
          const Spacer(),
          const CustomCheckbox(),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit(),
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
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        height: 70,
      ),
    );
  }
}
