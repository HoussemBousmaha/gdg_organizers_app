import 'package:flutter_bloc/flutter_bloc.dart';

class ToggelCubit extends Cubit<bool> {
  ToggelCubit() : super(true);

  void toggle() {
    emit(!state);
  }
}
 