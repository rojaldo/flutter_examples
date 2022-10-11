import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/apod/apodpage.dart';
import './pages/calculator/calculatorpage.dart';
import 'pages/heroes/heroespage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HeroesPage());
  }
}
