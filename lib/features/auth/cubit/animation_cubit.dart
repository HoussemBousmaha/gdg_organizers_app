import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(AnimationInitial(20, 40, 2));

  void changeAnimation() {
    emit(AnimationDone(0, 2000, 0));
  }
}
