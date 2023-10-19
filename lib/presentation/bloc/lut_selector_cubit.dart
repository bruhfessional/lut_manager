import 'package:bloc/bloc.dart';
import 'package:lut_manager/domain/entities/lut_selector_state.dart';

class LutSelectorCubit extends Cubit<LutSelectorState> {
  LutSelectorCubit() : super(const LutSelectorState(id: 0, name: '', path: ''));

  void select(int id, String name, String path) {
    emit(LutSelectorState(id: id, name: name, path: path));
  }
}
