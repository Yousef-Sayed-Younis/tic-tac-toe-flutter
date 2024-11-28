class AppConstants {
  AppConstants._();

  static late bool isAIMode;
  static late String playerPicked;

  static const X = 'X';
  static const O = 'O';
  static const D = 'D';

  static const animationDuration = Duration(milliseconds: 500);

  static const winPatterns = [
    [1, 5, 9], [3, 5, 7], // Diagonals
    [1, 2, 3], [4, 5, 6], [7, 8, 9], // Rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], // Columns
  ];

  static const winConditions = [
    [2, 4, 1], [2, 7, 1], // Left Upper Angle
    [8, 4, 7], [8, 1, 7], // Left Lower Angle
    [2, 6, 3], [2, 9, 3], // Right Upper Angle
    [8, 6, 9], [8, 3, 9], // Right Upper Angle
    [3, 7, 8], [6, 7, 9], // Right Lower Angle
  ];
}
