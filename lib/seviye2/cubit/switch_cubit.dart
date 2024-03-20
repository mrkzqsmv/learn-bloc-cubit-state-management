import 'package:chat_az/seviye2/repo/switch_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(false);
  var repo = SwitchRepo();
  changeSwicthState() {
    emit(repo.changeSwicthState(state));
  }
}
