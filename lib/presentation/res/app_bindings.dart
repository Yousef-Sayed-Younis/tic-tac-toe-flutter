import 'package:get/get.dart';

import '../game/game_controller.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() => Get.put<GameController>(GameController());
}
