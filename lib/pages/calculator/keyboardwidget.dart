import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  KeyboardWidget({Key? key, Function(dynamic)? onButtonClicked})
      : super(key: key) {
    // ignore: unnecessary_this
    _onButtonClicked = onButtonClicked!;
  }

  late final Function(dynamic) _onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
        ) // ElevatedButton
      ] // <Widget>[] children of Row
          )
    ]); // Row
  }
}
