import 'package:chat_az/seviye2/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<Usermodel?> {
  UserCubit() : super(null);

  saveUserInfo(Usermodel userModel) => emit(userModel);
}
