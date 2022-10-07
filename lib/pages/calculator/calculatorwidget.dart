import 'package:flutter/material.dart';
import './displaywidget.dart';
import './keyboardwidget.dart';
import '../../models/calculatorengine.dart';

class Calculatorwidget extends StatefulWidget {
  const Calculatorwidget({Key? key}) : super(key: key);

  @override
  _CalculatorwidgetState createState() => _CalculatorwidgetState();
}

class _CalculatorwidgetState extends State<Calculatorwidget> {
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
    return Column(
      children: [
        Displaywidget(display: this._display),
        KeyboardWidget(onButtonClicked: this._onButtonClicked)
      ], // <Widget>[] children of Column
    ); // Column
  }
}
