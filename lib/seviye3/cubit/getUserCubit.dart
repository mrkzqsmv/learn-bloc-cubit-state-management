import 'package:chat_az/seviye3/model/user_model.dart';
import 'package:chat_az/seviye3/repo/user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCubit extends Cubit<List<UserModel>> {
  GetUserCubit() : super([]);

  var userRepo = UserRepo();

  getAllUsers() async {
    var item = await userRepo.getUsers();
    emit(item);
  }

  saveUser(String userName, String userNumber) async {
    await userRepo.saveUserInfo(userName, userNumber);
  }

  updateUser(String uid, String userName, String userNumber) async {
    await userRepo.updateUser(uid, userName, userNumber);
    getAllUsers();
  }

  deleteUser(UserModel userModel) async {
    await userRepo.deleteUser(userModel);
    getAllUsers();
  }
}
