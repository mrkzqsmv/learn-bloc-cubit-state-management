import 'package:chat_az/seviye3/cubit/getUserCubit.dart';
import 'package:chat_az/seviye3/model/user_model.dart';
import 'package:chat_az/seviye3/page/addNewUser.dart';
import 'package:chat_az/seviye3/page/deleteAndUpdateUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserCubit>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kisiler'),
      ),
      body: Center(
        child: BlocBuilder<GetUserCubit, List<UserModel>>(
          builder: (context, state) {
            if (state.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    UserModel item = state[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DeleteAndUpdateUser(userModel: item)));
                        },
                        title: Text(item.userName),
                        subtitle: Text(item.userNumber),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('Goruntulenecek kisi yok'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewUser()));
        },
        child: const Icon(Icons.group),
      ),
    );
  }
}
