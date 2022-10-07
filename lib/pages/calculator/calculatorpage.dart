// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import '../../models/calculatorengine.dart';
import './displaywidget.dart';
import './keyboardwidget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '';

  CalculatorEngine _engine = CalculatorEngine();

  void _onButtonClicked(dynamic value) {
    if (value.runtimeType == String) {
      this._display = this._engine.processSymbol(value);
    } else if (value.runtimeType == int) {
      this._display = this._engine.processNumber(value);
    } else {
      throw Exception("Invalid type");
    }
    setState(() {
      this._display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Displaywidget(display: this._display),
            KeyboardWidget(onButtonClicked: this._onButtonClicked)
          ], // <Widget>[] children of Column
        ), // Column
      ), // Container
    ); // Scaffold
  } // Widget build
} // class _CalculatorPageState