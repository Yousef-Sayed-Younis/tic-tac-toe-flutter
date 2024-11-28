import 'package:flutter/material.dart';

import '../res/app_constants.dart';
import '../res/app_routes.dart';
import '../widgets/o.dart';
import '../widgets/screen.dart';
import '../widgets/x.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      content: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(child: X()), SizedBox(width: 40 * 3), O()]),
        Column(
          children: [
            Text("Choose Your Play Mode", style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 50),
            ElevatedButton(
                child: const Text("With AI"), onPressed: () => {AppConstants.isAIMode = true, Navigator.pushNamed(context, Routes.pickSide)}),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => {AppConstants.isAIMode = false, Navigator.pushNamed(context, Routes.pickSide)},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
              child: const Text("With a Friend"),
            ),
            const SizedBox(height: 80),
            IconButton.filled(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        )
      ],
    );
  }
}
