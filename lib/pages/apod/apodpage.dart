import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/apod/apodwidget.dart';

class Apodpage extends StatelessWidget {
  const Apodpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apod Sample'),
        ),
        body: const ApodWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.calendar_month),
        )); // Scaffold
  }
}
