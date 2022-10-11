import 'package:flutter/material.dart';

import 'heroeswidget.dart';

class HeroesPage extends StatelessWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes'),
      ),
      body: const HeroesWidget(),
    );
  }
}
