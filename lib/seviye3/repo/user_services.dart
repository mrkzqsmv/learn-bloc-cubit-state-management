import 'package:chat_az/seviye2/model/user_model.dart';
import 'package:chat_az/seviye3/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  var db = Hive.box<UserModel>('dbuser');

  List<UserModel> allUsers = [];

  //save info
  Future<void> saveUserInfo(String userName, String userNumber) async {
    String userID = const Uuid().v1();
    var newUser =
        UserModel(id: userID, userName: userName, userNumber: userNumber);

    await db.put(userID, newUser);
  }

  //update user
  Future<void> updateUser(
      String uid, String userName, String userNumber) async {
    String userID = const Uuid().v1();
    var newUser =
        UserModel(id: userID, userName: userName, userNumber: userNumber);

    await db.put(userID, newUser);
  }

  //get info
  Future<List<UserModel>> getUsers() async {
    if (db.isNotEmpty) {
      allUsers = db.values.toList();
      return allUsers;
    } else {
      return allUsers;
    }
  }

  //delete info
  Future<void> deleteUser(UserModel userModel) async {
    await db.delete(userModel.id);
  }
}
