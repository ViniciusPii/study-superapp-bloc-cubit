import 'home_bindings.dart';
import 'home_page.dart';
import 'package:get/get.dart';

class HomeModule {
  final GetPage route = GetPage(
    name: '/home',
    binding: HomeBindings(),
    page: () => const HomePage(),
  );
}
