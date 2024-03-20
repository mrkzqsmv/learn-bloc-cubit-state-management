import 'package:chat_az/seviye2/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  saveUserInfo(UserModel userModel) => emit(userModel);
}
