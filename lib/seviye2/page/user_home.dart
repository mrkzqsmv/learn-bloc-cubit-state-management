import 'package:chat_az/seviye2/cubit/switch_cubit.dart';
import 'package:chat_az/seviye2/cubit/user_cubit.dart';
import 'package:chat_az/seviye2/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home Screen'),
      ),
      body: Center(
        child: BlocBuilder<UserCubit, Usermodel?>(
          builder: (context, state) {
            var cardColor = context.read<SwitchCubit>().state;
            if (state != null) {
              return Card(
                color: cardColor ? Colors.green : Colors.pink,
                child: ListTile(
                  title: Text(state.name),
                  subtitle: Text(state.password),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
