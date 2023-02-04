import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/auth/cubit/animation_cubit.dart';

import '../auth/screens/authscreen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

const Duration duration = Duration(seconds: 2);

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late final AnimationController _firstcontroller;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    _firstcontroller = AnimationController(
      duration: Duration(seconds: 1, milliseconds: 200),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _firstcontroller,
      curve: Curves.bounceIn,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _firstcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimationCubit, AnimationState>(
      listener: (context, state) {
        if (state is AnimationDone) {
          _firstcontroller.forward();

          Future.delayed(Duration(seconds: 1)).then(
            (value) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()));
            },
          );
        }
      },
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: kBlue,
            ),
            Align(
              alignment: Alignment.center,
              child: SlideTransition(
                position: _animation,
                child: AnimatedContainer(
                    duration: const Duration(seconds: 2 , milliseconds: 500),
                    width: state.size,
                    height: state.size,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(state.borderRadius)),
                    child: TextButton(
                      child: Text('click me'),
                      onPressed: () {
                        BlocProvider.of<AnimationCubit>(context)
                            .changeAnimation();
                      },
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
