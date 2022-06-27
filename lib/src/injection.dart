import 'package:get_it/get_it.dart';
import 'package:superapp/src/modules/counter/bloc/counter_bloc.dart';
import 'package:superapp/src/modules/imc/bloc/imc_bloc.dart';

injection() {
  final getIt = GetIt.I;

  //controllers
  getIt.registerFactory(() => ImcBloc());
  getIt.registerFactory(() => CounterBloc());
}
