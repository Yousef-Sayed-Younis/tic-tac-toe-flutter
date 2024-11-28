import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../game/game_screen.dart';
import '../main_menu/main_menu_screen.dart';
import '../pick_side/pick_side_screen.dart';
import 'app_bindings.dart';

class Routes {
  Routes._();

  static const String mainMenu = "/mainMenu";
  static const String pickSide = "/pickSide";
  static const String gameBoard = "/gameBoard";
}

class RouteGenerator {
  RouteGenerator._();

  static List<GetPage> getRoutes() {
    return [
      GetPage(name: Routes.mainMenu, page: () => const MainMenuScreen()),
      GetPage(name: Routes.pickSide, page: () => const PickSideScreen()),
      GetPage(name: Routes.gameBoard, page: () => const GameScreen(), binding: GameBinding()),
    ];
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No Route Found"))));
}
