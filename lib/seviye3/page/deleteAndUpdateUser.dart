// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chat_az/seviye2/widget/textField.dart';
import 'package:chat_az/seviye3/cubit/getUserCubit.dart';
import 'package:chat_az/seviye3/model/user_model.dart';
import 'package:chat_az/seviye3/page/home.dart';

class DeleteAndUpdateUser extends StatefulWidget {
  final UserModel userModel;
  const DeleteAndUpdateUser({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<DeleteAndUpdateUser> createState() => _DeleteAndUpdateUserState();
}

class _DeleteAndUpdateUserState extends State<DeleteAndUpdateUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController usernumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.userModel.userName;
    usernumberController.text = widget.userModel.userNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New User Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: usernameController, labelText: 'Username'),
            TextFieldWidget(
              controller: usernumberController,
              labelText: 'Number',
              numberKeyboard: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      context.read<GetUserCubit>().updateUser(
                          widget.userModel.id,
                          usernameController.text,
                          usernumberController.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: const Text('Guncelle')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      context.read<GetUserCubit>().deleteUser(widget.userModel);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: const Text('Sil'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
