import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_constants.dart';
import '../res/app_routes.dart';
import '../widgets/o.dart';
import '../widgets/screen.dart';
import '../widgets/x.dart';

class PickSideScreen extends StatelessWidget {
  const PickSideScreen({super.key});

  static final RxString _sidePicked = AppConstants.X.obs;

  @override
  Widget build(BuildContext context) {
    return Screen(
      content: [
        Text("Pick Your Side", style: Theme.of(context).textTheme.displayLarge),
        _buildSidePicker(),
        ElevatedButton(
          child: const Text("Continue"),
          onPressed: () => {AppConstants.playerPicked = _sidePicked.value, Navigator.pushReplacementNamed(context, Routes.gameBoard)},
        ),
      ],
    );
  }

  SizedBox _buildSidePicker() {
    return SizedBox(
      height: 180,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildSideOption(true), const SizedBox(width: 120), _buildSideOption(false)],
        ),
      ),
    );
  }

  AnimatedOpacity _buildSideOption(bool isXPicked) {
    return AnimatedOpacity(
      duration: AppConstants.animationDuration,
      opacity: _sidePicked.value == (isXPicked ? AppConstants.X : AppConstants.O) ? 1 : .2,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [isXPicked ? const X() : const O(), _buildPickButton(isXPicked ? AppConstants.X : AppConstants.O)]),
    );
  }

  Transform _buildPickButton(String side) =>
      Transform.scale(scale: 2, child: Radio(value: side, groupValue: _sidePicked.value, onChanged: (side) => _sidePicked.value = side!));
}
