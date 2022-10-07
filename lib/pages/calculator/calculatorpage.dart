// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_sample/pages/calculator/calculatorwidget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Calculatorwidget(),
      ), // Container
    ); // Scaffold
  } // Widget build
} // class _CalculatorPageState