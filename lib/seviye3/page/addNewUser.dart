import 'package:chat_az/seviye2/widget/textField.dart';
import 'package:chat_az/seviye3/cubit/getUserCubit.dart';
import 'package:chat_az/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController usernumberController = TextEditingController();

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
            ElevatedButton(
                onPressed: () {
                  context.read<GetUserCubit>().saveUser(
                      usernameController.text, usernumberController.text);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text('Kaydet'))
          ],
        ),
      ),
    );
  }
}
