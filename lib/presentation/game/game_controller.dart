import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_constants.dart';
import '../widgets/snack_bar.dart';

class GameController extends GetxController {
  late String _winner;
  static late List<String> gameMatrix;
  var scoreboard = (X: 0, O: 0, D: 0);
  String _currentPlayer = AppConstants.playerPicked;
  final computer = switchSides(AppConstants.playerPicked);

  // Utility Methods
  bool _canChoose(String pos) => pos != AppConstants.X && pos != AppConstants.O;

  void _resetMatrix() => gameMatrix = List.generate(10, (index) => index.toString());
  
  static String switchSides(String side) => side == AppConstants.X ? AppConstants.O : AppConstants.X;

  // Lifecycle Methods
  @override
  void onInit() => {_resetMatrix(), super.onInit()};

  // Game Logic
  void resetGame() => {_clearBoard(), _clearScore()};

  void _evaluateWinner() => {_winner = _findWinner(), _winner.isNotEmpty ? _showResultSnackBar() : null};

  void onBoxTapped(int index) {
    if (_canChoose(gameMatrix[index])) {
      gameMatrix[index] = _currentPlayer;
      AppConstants.isAIMode ? startAI() : _currentPlayer = switchSides(_currentPlayer);

      update(["game"]);
      _evaluateWinner();
    }
  }

  String _findWinner() {
    for (List<int> pattern in AppConstants.winPatterns) {
      int x = pattern[0], y = pattern[1], z = pattern[2];
      if (gameMatrix[x] == gameMatrix[y] && gameMatrix[y] == gameMatrix[z]) return gameMatrix[y];
    }

    return gameMatrix.sublist(1).any(_canChoose) ? '' : AppConstants.D;
  }

  int canWin() {
    for (List<int> pattern in AppConstants.winPatterns) {
      int x = pattern[0], y = pattern[1], z = pattern[2];
      if (gameMatrix[x] == gameMatrix[y] && _canChoose(gameMatrix[z])) return z;
      if (gameMatrix[x] == gameMatrix[z] && _canChoose(gameMatrix[y])) return y;
      if (gameMatrix[y] == gameMatrix[z] && _canChoose(gameMatrix[x])) return x;
    }

    for (List<int> condition in AppConstants.winConditions) {
      if (gameMatrix[condition[0]] == gameMatrix[condition[1]] && _canChoose(gameMatrix[condition[2]])) return condition[2];
    }

    return -1;
  }

  void startAI() {
    int position = canWin();
    if (gameMatrix[5] == '5') {
      gameMatrix[5] = computer;
    } else if (position != -1) {
      gameMatrix[position] = computer;
    } else {
      gameMatrix[int.parse(gameMatrix.sublist(1).firstWhere(_canChoose, orElse: () => '0'))] = computer;
    }
  }

  // Scoreboard
  void _clearScore() => scoreboard = (X: 0, O: 0, D: 0);

  void _updateScoreboard() {
    scoreboard = switch (_winner) {
      AppConstants.X => (X: scoreboard.X + 1, O: scoreboard.O, D: scoreboard.D),
      AppConstants.O => (X: scoreboard.X, O: scoreboard.O + 1, D: scoreboard.D),
      AppConstants.D => (X: scoreboard.X, O: scoreboard.O, D: scoreboard.D + 1),
      _ => scoreboard
    };
  }

  void _clearBoard() {
    _resetMatrix();
    if (_winner.isNotEmpty) _updateScoreboard();
    update(['score', 'game']);
  }

  void _showResultSnackBar() => {_clearBoard(), ScaffoldMessenger.of(Get.context!).showSnackBar(buildSnackBar(_winner))};
}
