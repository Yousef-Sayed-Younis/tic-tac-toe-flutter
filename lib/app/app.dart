import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/res/app_routes.dart';
import '../presentation/res/app_theme.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tic Tac Toe",
      themeMode: ThemeMode.light,
      initialRoute: Routes.mainMenu,
      theme: AppTheme.getLightTheme(),
      debugShowCheckedModeBanner: false,
      getPages: RouteGenerator.getRoutes(),
    );
  }
}
