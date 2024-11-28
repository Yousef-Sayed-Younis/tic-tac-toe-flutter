import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_colors.dart';
import '../res/app_constants.dart';
import '../widgets/o.dart';
import '../widgets/screen.dart';
import '../widgets/x.dart';
import 'game_controller.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Screen(
      content: [
        GetBuilder<GameController>(
          id: 'score',
          builder: (_) => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildScoreColumn(const X(size: 10), controller.scoreboard.X, "wins"),
              _buildScoreColumn(const O(size: 10), controller.scoreboard.O, "wins"),
              _buildScoreColumn(const Icon(Icons.balance_rounded, size: 30), controller.scoreboard.D, "draws"),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [BoxShadow(offset: Offset.zero, blurRadius: 7, spreadRadius: 5, color: Color.fromRGBO(158, 158, 158, .2))],
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.primaryColor, Color(0xFFf77e37)]),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: size.width,
              height: size.width * .96,
              child: Stack(
                children: [
                  // Blur Effect
                  BackdropFilter(filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), child: const SizedBox.expand()),

                  // Gradient Effect
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: const Color.fromRGBO(255, 255, 255, .13)),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color.fromRGBO(255, 255, 255, .15), Color.fromRGBO(255, 255, 255, .05)]),
                    ),
                  ),

                  GridView.builder(
                    itemCount: 3 * 3,
                    padding: const EdgeInsets.all(40),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (_, index) => GetBuilder<GameController>(
                      id: "game",
                      builder: (_) => GestureDetector(
                        onTap: () => controller.onBoxTapped(index + 1),
                        child: Container(
                            alignment: Alignment.center, decoration: BoxDecoration(border: _getBorder(index + 1)), child: _getXorO(index + 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.filled(onPressed: () => controller.resetGame(), icon: const Icon(Icons.autorenew_rounded)),
            IconButton.filled(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        )
      ],
    );
  }

  Column _buildScoreColumn(Widget icon, int score, String label) =>
      Column(children: [icon, SizedBox(height: label == 'wins' ? 25 : 10), Text("$score $label")]);

  Border? _getBorder(int index) {
    final Color color = Colors.blueGrey.shade100;
    final BorderSide borderSide = BorderSide(color: color);

    if (index == 5) return Border.all(color: color);
    if (index == 2 || index == 8) return Border.symmetric(vertical: borderSide);
    if (index.isEven) return Border.symmetric(horizontal: borderSide);

    return null;
  }

  Widget? _getXorO(int index) =>
      switch (GameController.gameMatrix[index]) { AppConstants.X => const X(size: 20), AppConstants.O => const O(size: 20), _ => null };
}