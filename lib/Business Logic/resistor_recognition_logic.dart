import 'package:electronic_packet_tools/constants.dart';
import 'package:electronic_packet_tools/main_menu.dart';
import 'package:flutter/material.dart';

class ResitoRecogntionLogic extends ChangeNotifier {
  final List<Color> _baseStripColor = [
    Colors.black,
    Colors.black,
    Colors.black,
    customColors.brown,
  ];

  List<Color> _firstGradientColor = [
    Colors.black,
    Colors.black,
    Colors.black,
    customColors.brown,
  ];
  List<Color> _secondGradientColor = [
    Colors.black,
    Colors.black,
    Colors.black,
    customColors.brown,
  ];

  int _firstValue = 0;
  int _secondValue = 0;
  int _multiplyValue = 1;
  String _toleranceValue = '± 1%';
  String _result = '0Ω ± 1%';

  void _resetStripes() {
    for (int i = 0; i < _baseStripColor.length; i++) {
      _firstGradientColor[i] = _baseStripColor[i];
      _secondGradientColor[i] = _baseStripColor[i];
    }
  }

  void _resetValues() {
    _firstValue = 0;
    _secondValue = 0;
    _multiplyValue = 1;
    _toleranceValue = '± 1%';
    _result = '0Ω ± 1%';
  }

  void resetAll() {
    _resetStripes();
    _resetValues();
    notifyListeners();
  }

  void _setValue(int index, String text) {
    switch (index) {
      case 0:
        _setFirstValue(text);
        break;
      case 1:
        _setSecondValue(text);
        break;
      case 2:
        _setMultiplyValue(text);
        break;
      case 3:
        _setToleranceValue(text);
        break;
    }
    _calulateResult();
  }

  void _setFirstValue(String text) {
    _firstValue = int.parse(text);
  }

  void _setSecondValue(String text) {
    _secondValue = int.parse(text);
  }

  void _setMultiplyValue(String text) {
    _multiplyValue = resitanceButtonsValues[text]!;
  }

  void _setToleranceValue(String text) {
    _toleranceValue = text;
  }

  void _calulateResult() {
    int value = ((_firstValue * 10) + _secondValue) * _multiplyValue;
    String valueText = '';

    if (value >= 1000000000) {
      valueText = (value / 1000000000).toStringAsFixed(0) + 'GΩ';
    } else if (value >= 1000000) {
      valueText = (value / 1000000).toStringAsFixed(0) + 'MΩ';
    } else if (value >= 1000) {
      valueText = (value / 1000).toStringAsFixed(0) + 'kΩ';
    } else {
      valueText = value.toStringAsFixed(0) + 'Ω';
    }

    _result = '$valueText $_toleranceValue';
    notifyListeners();
  }

  String get result => _result;

  Color getStripeFirstColor({required int index}) {
    return _firstGradientColor[index];
  }

  Color getStripeSecondColor({required int index}) {
    return _secondGradientColor[index];
  }

  void _setStripeColor(int index, Color firstcolor, Color secondColor) {
    _firstGradientColor[index] = firstcolor;
    _secondGradientColor[index] = secondColor;
  }

  void calculate(int index, Color firstcolor, Color secondColor, String text) {
    _setStripeColor(index, firstcolor, secondColor);
    _setValue(index, text);
  }

  void setDropdownMultiplyer(String unit) {
    _setMultiplyValue('1 ' + unit);

    switch (unit) {
      case 'Ω':
        _setStripeColor(2, Colors.black, Colors.black);
        break;
      case 'kΩ':
        _setStripeColor(2, customColors.orange, customColors.orange);
        break;
      case 'MΩ':
        _setStripeColor(2, customColors.blue, customColors.blue);
        break;
      case 'GΩ':
        _setStripeColor(2, Colors.white, Colors.white);
        break;
    }

    _calulateResult();
  }

  void inputValue(String value) {
    int input = int.parse(value);

    if (true && input >= 0 && input <= 99) {
      _firstValue = (input ~/ 10) % 10;
      _secondValue = input % 10;

      _calculateColor(_firstValue, 0);
      _calculateColor(_secondValue, 1);
    } else {
      resetAll();
    }
    _calulateResult();
  }

  void _calculateColor(int number, int index) {
    Color color = Colors.black;

    switch (number) {
      case 0:
        color = Colors.black;
        break;
      case 1:
        color = customColors.brown;
        break;
      case 2:
        color = customColors.red;
        break;
      case 3:
        color = customColors.orange;
        break;
      case 4:
        color = customColors.yellow;
        break;
      case 5:
        color = customColors.green;
        break;
      case 6:
        color = customColors.blue;
        break;
      case 7:
        color = customColors.purple;
        break;
      case 8:
        color = customColors.grey;
        break;
      case 9:
        color = Colors.white;
        break;
    }

    _setStripeColor(index, color, color);
    notifyListeners();
  }
}
