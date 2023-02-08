import 'package:flutter_bloc/flutter_bloc.dart';

class ToggelCubit extends Cubit<bool> {
  ToggelCubit() : super(false);

  void toggle() {
    emit(!state);
  }

  void on() {
    emit(true);
  }
  void off() {
    emit(false);
  }
  void toggleWith(bool value) {
    emit(value);
  }
}
 