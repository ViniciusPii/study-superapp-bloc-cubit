import 'package:get_it/get_it.dart';
import 'package:superapp/src/modules/counter/bloc/counter_bloc.dart';

injection() {
  final getIt = GetIt.I;

  //controllers
  getIt.registerFactory(() => CounterBloc());
}
