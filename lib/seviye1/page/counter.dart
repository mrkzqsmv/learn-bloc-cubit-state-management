import 'package:chat_az/seviye1/cubit/giris_cubit.dart';
import 'package:chat_az/seviye1/widget/girisBuilderTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Center(
          child: GirisBuilderTextWidget(),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<GirisCubit>().arttir();
              },
              child: const Icon(Icons.plus_one),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<GirisCubit>().azalt();
              },
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ));
  }
}

