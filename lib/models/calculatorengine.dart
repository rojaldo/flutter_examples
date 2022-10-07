// ignore_for_file: unnecessary_this

enum States {
  init,
  firstFigure,
  secondFigure,
  result,
}

class CalculatorEngine {
  States _state = States.init;
  num _firstFigure = 0;
  num _secondFigure = 0;
  num _result = 0;
  String _operator = '';
  String _display = '';

  CalculatorEngine() {}

  num _calculate() {
    switch (this._operator) {
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

  String processSymbol(String symbol) {
    switch (this._state) {
      case States.init:
        break;
      case States.firstFigure:
        if (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
          this._operator = symbol;
          this._display += symbol;
          this._state = States.secondFigure;
        }
        break;
      case States.secondFigure:
        if (symbol == '=') {
          this._result = this._calculate();
          this._display += symbol + this._result.toString();
          this._state = States.result;
        }
        break;
      case States.result:
        if (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
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
    }
    return this._display;
  }

  String processNumber(int number) {
    print(this._state.toString() + ' : ' + States.init.toString());
    switch (this._state) {
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
    return this._display;
  }
}
