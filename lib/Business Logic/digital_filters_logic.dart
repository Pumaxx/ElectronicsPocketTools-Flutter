import 'package:flutter/material.dart';

class DigitalFiltersLogic extends ChangeNotifier {
  int _radioGroupValue = 1;
  String _resultText = '';
  bool _errorColor = false;
  String _firstParameters = '';
  String _secondParameters = '';
  bool _goodToCalculate = false;

  int get radioGroupValue => _radioGroupValue;
  String get resultText => _resultText;
  bool get errorColor => _errorColor;

  void setFirstParameters(String params) {
    _firstParameters = params;
  }

  void setSecondParameters(String params) {
    _secondParameters = params;
  }

  void switchRadio(int value) {
    if (value == 2) {
      _radioGroupValue = 2;
    } else {
      _radioGroupValue = 1;
    }
    notifyListeners();
  }

  void calculate() {
    if (_checkParameters()) {
      try {
        List<double> firstParameters = _inputToArray(_firstParameters);
        List<double> secondParameters = _inputToArray(_secondParameters);

        if (_radioGroupValue == 1) {
          if (_bothEvenOrBothOdd(
              firstParameters.length, secondParameters.length)) {
            List<double> resultArray =
                _calculateParallel(firstParameters, secondParameters);

            _errorColor = false;
            _resultText = resultArray.toString();
          } else {
            _errorColor = true;
            _resultText =
                'For parallel realisation number of both filter parameters can be the same ' +
                    'or can be different if both numbers are simultaneously even or simultaneously odd';
          }
        } else {
          List<double> resultArray =
              _calculateSeries(firstParameters, secondParameters);

          _errorColor = false;
          _resultText = resultArray.toString();
        }
      } catch (e) {
        _errorColor = true;
        _resultText = 'Please check if parameters input is correct';
      }
    }

    notifyListeners();
  }

  void resetAll() {
    _radioGroupValue = 1;
    _resultText = '';
    _errorColor = false;
    _firstParameters = '';
    _secondParameters = '';
    _goodToCalculate = false;
    notifyListeners();
  }

  bool _checkParameters() {
    _goodToCalculate = _bothFieldsNotEmpty() && _bothFieldsWithoutDoubleDot();

    if (!_goodToCalculate) {
      _errorColor = true;

      if (!_bothFieldsNotEmpty()) {
        _resultText = 'Both filters need parameters';
      } else if (!_bothFieldsWithoutDoubleDot()) {
        _resultText = 'Double dot detected in text field';
      }
    }

    return _goodToCalculate;
  }

  bool _bothFieldsNotEmpty() {
    return _firstParameters.isNotEmpty && _secondParameters.isNotEmpty;
  }

  bool _bothFieldsWithoutDoubleDot() {
    return !_firstParameters.contains('..') &&
        !_secondParameters.contains('..');
  }

  List<double> _inputToArray(String paramsText) {
    String params = paramsText.replaceAll(new RegExp(r'[^\d\.\-]'), ' ');

    List<double> paramsList =
        params.trim().split(' ').map(double.parse).toList();

    return paramsList;
  }

  List<double> _calculateSeries(
      List<double> firstFilterParams, List<double> secondFilterParams) {
    int firstSize = firstFilterParams.length;
    int secondSize = secondFilterParams.length;
    int resultSize = firstSize + secondSize - 1;

    List<double> result = List.filled(resultSize, 0.0);

    for (int n = 0; n < resultSize; n++) {
      for (int k = 0; k < secondSize; k++) {
        if (n - k >= 0 && n - k < firstSize) {
          result[n] += firstFilterParams[n - k] * secondFilterParams[k];
        }
      }
    }

    return result;
  }

  List<double> _calculateParallel(
      List<double> firstFilterParams, List<double> secondFilterParams) {
    int firstSize = firstFilterParams.length;
    int secondSize = secondFilterParams.length;

    List<double> result = [];

    if (firstSize > secondSize) {
      int diff = firstSize - secondSize;
      List<double> extendedSorterArray =
          _fillSmallerArrayWithZeros(secondFilterParams, diff);

      result = _fillParallelArray(firstFilterParams, extendedSorterArray);
    } else if (secondSize > firstSize) {
      int diff = secondSize - firstSize;
      List<double> extendedSorterArray =
          _fillSmallerArrayWithZeros(firstFilterParams, diff);

      result = _fillParallelArray(secondFilterParams, extendedSorterArray);
    } else {
      result = _fillParallelArray(firstFilterParams, secondFilterParams);
    }

    return result;
  }

  List<double> _fillSmallerArrayWithZeros(List<double> smallerArray, int diff) {
    List<double> extendedSorterArray = [];

    extendedSorterArray.addAll(List.generate(diff ~/ 2, (_) => 0.0));
    extendedSorterArray.addAll(smallerArray);
    extendedSorterArray.addAll(List.generate(diff ~/ 2, (_) => 0.0));

    return extendedSorterArray;
  }

  List<double> _fillParallelArray(
      List<double> firstArray, List<double> secondArray) {
    int iter = 0;

    List<double> result = List.filled(firstArray.length, 0.0);

    while (iter < result.length) {
      result[iter] = firstArray[iter] + secondArray[iter];
      iter++;
    }

    return result;
  }

  bool _bothEvenOrBothOdd(int sizeOne, int sizeTwo) {
    return sizeOne % 2 == sizeTwo % 2;
  }
}
