import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superapp/src/modules/counter/bloc/counter_bloc.dart';
import 'package:superapp/src/modules/counter/counter_page.dart';
import 'package:superapp/src/modules/home/home_page.dart';

class Routes {
  static const String home = '/';
  static const String counter = '/counter';

  final routes = {
    home: (context) => const HomePage(),
    counter: (context) => BlocProvider(
          create: (context) => CounterBloc(),
          child: const CounterPage(),
        ),
  };
}
