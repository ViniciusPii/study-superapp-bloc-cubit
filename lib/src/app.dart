import 'package:flutter/material.dart';
import 'package:superapp/src/core/theme/app_theme.dart';
import 'package:superapp/src/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes().routes,
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
