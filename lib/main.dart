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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _display = '';

  void onButtonClicked(dynamic value) {
    print("Button Clicked: $value");
    setState(() {
      this._display = this._display + value.toString();
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
              onPressed: () => onButtonClicked('7'),
            ),
            ElevatedButton(
              child: const Text('8'),
              onPressed: () => onButtonClicked('8'),
            ),
            ElevatedButton(
              child: const Text('9'),
              onPressed: () => onButtonClicked('9'),
            ),
            ElevatedButton(
              child: const Text('/'),
              onPressed: () => onButtonClicked('/'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('4'),
              onPressed: () => onButtonClicked('4'),
            ),
            ElevatedButton(
              child: const Text('5'),
              onPressed: () => onButtonClicked('5'),
            ),
            ElevatedButton(
              child: const Text('6'),
              onPressed: () => onButtonClicked('6'),
            ),
            ElevatedButton(
              child: const Text('*'),
              onPressed: () => onButtonClicked('*'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('1'),
              onPressed: () => onButtonClicked('1'),
            ),
            ElevatedButton(
              child: const Text('2'),
              onPressed: () => onButtonClicked('2'),
            ),
            ElevatedButton(
              child: const Text('3'),
              onPressed: () => onButtonClicked('3'),
            ),
            ElevatedButton(
              child: const Text('-'),
              onPressed: () => onButtonClicked('-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('c'),
              onPressed: () => onButtonClicked('c'),
            ),
            ElevatedButton(
              child: const Text('0'),
              onPressed: () => onButtonClicked('0'),
            ),
            ElevatedButton(
              child: const Text('='),
              onPressed: () => onButtonClicked('='),
            ),
            ElevatedButton(
              child: const Text('+'),
              onPressed: () => onButtonClicked('+'),
            ), // ElevatedButton
          ], // <Widget>[] children of Row
        ), // Row
      ], // <Widget>[] children of Column
    ), // Column
      ), // Container
      ); // Scaffold
  } // Widget build
} // class _MyHomePageState