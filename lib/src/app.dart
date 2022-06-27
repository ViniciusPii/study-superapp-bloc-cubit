import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:superapp/src/core/theme/app_theme.dart';
import 'package:superapp/src/modules/counter/counter_module.dart';
import 'package:superapp/src/modules/home/home_module.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      getPages: [
        HomeModule().route,
        CounterModule().route,
      ],
    );
  }
}
