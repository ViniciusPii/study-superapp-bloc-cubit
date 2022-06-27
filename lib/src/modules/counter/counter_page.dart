import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:superapp/src/core/theme/app_dimension.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';
import 'package:superapp/src/core/utils/utils.dart';
import 'package:superapp/src/modules/counter/counter_controller.dart';

class CounterPage extends GetView<CounterController> {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Utils.getColor(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCounter(),
            const SizedBox(
              height: AppDimension.size_2,
            ),
            _buildButtons(color),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Obx(
      () => Text(
        'Contador ${controller.counter}',
        style: AppFonts.titleLarge(),
      ),
    );
  }

  Widget _buildButtons(Color color) {
    return Obx(
      () => Visibility(
        visible: controller.loading,
        replacement: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => controller.increment(),
              child: Text(
                '+',
                style: AppFonts.titleLarge(),
              ),
            ),
            TextButton(
              onPressed: () => controller.decrement(),
              child: Text(
                '-',
                style: AppFonts.titleLarge(),
              ),
            ),
          ],
        ),
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
