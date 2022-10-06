import 'package:flutter/material.dart';
// import raised button
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'My Flutter Demo'),
    );
  }
}

enum States {
  init,
  firstFigure,
  secondFigure,
  result,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _display = '';
  String _myDisplay = '';
  States _state = States.init;
  num _firstFigure = 0;
  num _secondFigure = 0;
  num _result = 0;
  String _operator = '';

  num _calculate(){
    switch(this._operator){
      case '+':
        return _firstFigure + _secondFigure;
      case '-':
        return _firstFigure - _secondFigure;
      case '*':
        return _firstFigure * _secondFigure;
      case '/':
        return _firstFigure / _secondFigure;
      default:
        return 0;
    }
  }

  void _processSymbol(String symbol) {
    switch(this._state) {
      case States.init:
        break;
      case States.firstFigure:
        if(symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
          this._operator = symbol;
          this._display += symbol;
          this._state = States.secondFigure;
        }
        break;
      case States.secondFigure:
        if(symbol == '=') {
          this._result = this._calculate();
          this._display += symbol + this._result.toString();
          this._state = States.result;
        }
        break;
      case States.result:
        if(symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
          this._operator = symbol;
          this._firstFigure = this._result;
          this._secondFigure = 0;
          this._result = 0;
          this._display = this._firstFigure.toString() + symbol;
          this._state = States.secondFigure;
        }
        break;
      default:
        throw Exception('Unknown state');
        break;
    }
  }

  void _processNumber(int number) {
    print(this._state.toString() + ' : ' + States.init.toString());
    switch(this._state) {
      case States.init:

        this._display = number.toString();
        this._firstFigure = number;
        this._state = States.firstFigure;
        print('init: ' + this._display);
        break;
      case States.firstFigure:
        this._display += number.toString();
        this._firstFigure = this._firstFigure * 10 + number;
        break;
      case States.secondFigure:
        this._display += number.toString();
        this._secondFigure = this._secondFigure * 10 + number;
        break;
      case States.result:
        this._display = number.toString();
        this._firstFigure = number;
        this._secondFigure = 0;
        this._result = 0;
        this._operator = '';
        this._state = States.firstFigure;
        break;
      default:
        throw Exception('Unknown state');
        break;
    }
  }

  void _onButtonClicked(dynamic value) {
    print("Button Clicked: ${value.runtimeType}");
    if(value.runtimeType == String) {
      this._processSymbol(value);
    }else if(value.runtimeType == int) {
      this._processNumber(value);
    }else {
      throw Exception("Invalid type");
    }
    print('Display: ' + this._display);
    setState(() {
      this._myDisplay = this._display;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
            child:
              Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_display",
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('7'),
              onPressed: () => _onButtonClicked(7),
            ),
            ElevatedButton(
              child: const Text('8'),
              onPressed: () => _onButtonClicked(8),
            ),
            ElevatedButton(
              child: const Text('9'),
              onPressed: () => _onButtonClicked(9),
            ),
            ElevatedButton(
              child: const Text('/'),
              onPressed: () => _onButtonClicked('/'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('4'),
              onPressed: () => _onButtonClicked(4),
            ),
            ElevatedButton(
              child: const Text('5'),
              onPressed: () => _onButtonClicked(5),
            ),
            ElevatedButton(
              child: const Text('6'),
              onPressed: () => _onButtonClicked(6),
            ),
            ElevatedButton(
              child: const Text('*'),
              onPressed: () => _onButtonClicked('*'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('1'),
              onPressed: () => _onButtonClicked(1),
            ),
            ElevatedButton(
              child: const Text('2'),
              onPressed: () => _onButtonClicked(2),
            ),
            ElevatedButton(
              child: const Text('3'),
              onPressed: () => _onButtonClicked(3),
            ),
            ElevatedButton(
              child: const Text('-'),
              onPressed: () => _onButtonClicked('-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('c'),
              onPressed: () => _onButtonClicked('c'),
            ),
            ElevatedButton(
              child: const Text('0'),
              onPressed: () => _onButtonClicked(0),
            ),
            ElevatedButton(
              child: const Text('='),
              onPressed: () => _onButtonClicked('='),
            ),
            ElevatedButton(
              child: const Text('+'),
              onPressed: () => _onButtonClicked('+'),
            ), // ElevatedButton
          ], // <Widget>[] children of Row
        ), // Row
      ], // <Widget>[] children of Column
    ), // Column
      ), // Container
      ); // Scaffold
  } // Widget build
} // class _MyHomePageState