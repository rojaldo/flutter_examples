import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/beers/beerswidget.dart';

class BeersPage extends StatelessWidget {
  const BeersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers'),
      ),
      body: const BeersWidget(),
    );
  }
}
