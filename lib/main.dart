import 'package:chat_az/seviye1/cubit/giris_cubit.dart';
import 'package:chat_az/seviye1/widget/girisBuilderTextWidget.dart';
import 'package:chat_az/seviye2/cubit/switch_cubit.dart';
import 'package:chat_az/seviye2/cubit/user_cubit.dart';
import 'package:chat_az/seviye2/page/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogScreen(),
      ),
    );
  }
}
