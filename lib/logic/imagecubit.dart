import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<XFile?> {
  ImageCubit() : super(null);

  void changeCoverPhoto(XFile? image) {
    emit(image);
  }

  void clear() {
    emit(null);
  }
}
