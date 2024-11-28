import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final List<Widget> content;
  const Screen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: content));
  }
}
