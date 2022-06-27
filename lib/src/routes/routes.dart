import 'package:superapp/src/modules/counter/counter_page.dart';
import 'package:superapp/src/modules/home/home_page.dart';

class Routes {
  static const String home = '/';
  static const String counter = '/counter';

  final routes = {
    home: (context) => const HomePage(),
    counter: (context) => const CounterPage(),
  };
}
