part of 'animation_cubit.dart';

@immutable
abstract class AnimationState {
  
    final double borderRadius;
  final double size;
  final double begin;

  AnimationState(this.borderRadius, this.size, this.begin);

}

class AnimationInitial extends AnimationState {
  AnimationInitial(super.borderRadius, super.size, super.begin);
}
   
class AnimationDone extends AnimationState {
  AnimationDone(super.borderRadius, super.size, super.begin);
}