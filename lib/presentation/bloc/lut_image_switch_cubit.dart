import 'package:bloc/bloc.dart';
import 'package:lut_manager/domain/entities/lut_image_switch_state.dart';

class LutImageSwitchCubit extends Cubit<LutImageSwitchState> {
  LutImageSwitchCubit() : super(const LutImageSwitchState(status: false));

  void setOpposite() {
    emit(LutImageSwitchState(status: !(state.status)));
  }
}
