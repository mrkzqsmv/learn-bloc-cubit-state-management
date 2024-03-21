import 'package:chat_az/seviye1/cubit/giris_cubit.dart';
import 'package:chat_az/seviye1/widget/girisBuilderTextWidget.dart';
import 'package:chat_az/seviye2/cubit/switch_cubit.dart';
import 'package:chat_az/seviye2/cubit/user_cubit.dart';
import 'package:chat_az/seviye2/page/log.dart';
import 'package:chat_az/seviye3/cubit/getUserCubit.dart';
import 'package:chat_az/seviye3/model/user_model.dart';
import 'package:chat_az/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('dbuser');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GirisCubit()),
        BlocProvider(create: (context) => SwitchCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => GetUserCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
