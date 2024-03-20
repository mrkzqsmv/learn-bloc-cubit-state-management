import 'package:chat_az/seviye2/cubit/switch_cubit.dart';
import 'package:chat_az/seviye2/cubit/user_cubit.dart';
import 'package:chat_az/seviye2/model/user_model.dart';
import 'package:chat_az/seviye2/page/user_home.dart';
import 'package:chat_az/seviye2/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool deger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seviye 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(controller: nameController, labelText: 'Name'),
            TextFieldWidget(
                controller: passwordController, labelText: 'Password'),
            BlocBuilder<SwitchCubit, bool>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state ? const Text('Admin') : const Text('Person'),
                    Switch(
                        value: state,
                        onChanged: (bool a) {
                          context.read<SwitchCubit>().changeSwicthState();
                        }),
                  ],
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    var userModel = UserModel(
                        name: nameController.text,
                        password: passwordController.text);
                    context.read<UserCubit>().saveUserInfo(userModel);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeScreen()));
                  }
                },
                child: const Text('Kaydet'))
          ],
        ),
      ),
    );
  }
}
