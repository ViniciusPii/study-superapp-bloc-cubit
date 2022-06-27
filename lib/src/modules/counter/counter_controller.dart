import 'package:get/get.dart';

class CounterController extends GetxController {
  final _counter = RxInt(0);
  final _loading = RxBool(false);

  int get counter => _counter.value;
  bool get loading => _loading.value;

  void increment() async {
    _loading.toggle();
    await Future.delayed(const Duration(milliseconds: 800));
    _counter.value++;
    _loading.toggle();
  }

  void decrement() async {
    if (_counter.value > 0) {
      _loading.toggle();
      await Future.delayed(const Duration(milliseconds: 800));
      _counter.value--;
      _loading.toggle();
    }
  }
}
