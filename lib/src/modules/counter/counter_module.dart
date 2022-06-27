import 'counter_bindings.dart';
import 'counter_page.dart';
import 'package:get/get.dart';

class CounterModule {
  final GetPage route = GetPage(
    name: '/counter',
    binding: CounterBindings(),
    page: () => const CounterPage(),
  );
}
