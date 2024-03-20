import 'package:chat_az/seviye1/repo/giris_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisCubit extends Cubit<int> {
  GirisCubit() : super(0);
  var repo = GirisRepo();

  void arttir() => emit(repo.arttir(state));

  void azalt() => emit(repo.azalt(state));
}
