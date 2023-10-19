import 'package:bloc/bloc.dart';
import 'package:lut_manager/domain/entities/image_selector_state.dart';

class ImageSelectorCubit extends Cubit {
  ImageSelectorCubit() : super(const ImageSelectorState(path: ''));
}
