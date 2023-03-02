import 'dart:math';

import 'package:electronic_packet_tools/Business%20Logic/utils.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PreferredValuesLogic extends ChangeNotifier {
  List<String> _e3Row = ['', '', ''];
  List<String> _e6Row = ['', '', ''];
  List<String> _e12Row = ['', '', ''];
  List<String> _e24Row = ['', '', ''];
  List<String> _e48Row = ['', '', ''];
  List<String> _e96Row = ['', '', ''];
  List<String> _e192Row = ['', '', ''];

  String _idealInput = '';

  List<String> get e3Row => _e3Row;
  List<String> get e6Row => _e6Row;
  List<String> get e12Row => _e12Row;
  List<String> get e24Row => _e24Row;
  List<String> get e48Row => _e48Row;
  List<String> get e96Row => _e96Row;
  List<String> get e192Row => _e192Row;

  void setIdealInput(String value) {
    _idealInput = value;
  }

  void _resetRows() {
    _e3Row = ['', '', ''];
    _e6Row = ['', '', ''];
    _e12Row = ['', '', ''];
    _e24Row = ['', '', ''];
    _e48Row = ['', '', ''];
    _e96Row = ['', '', ''];
    _e192Row = ['', '', ''];
  }

  void resetAll() {
    _resetRows();
    _idealInput = '';
  }

  void countPreferredValues() {
    if (Utils.correctInput(_idealInput)) {
      countRow(_e3Row, E3Series);
      countRow(_e6Row, E6Series);
      countRow(_e12Row, E12Series);
      countRow(_e24Row, E24Series);
      countRow(_e48Row, E48Series);
      countRow(_e96Row, E96Series);
      countRow(_e192Row, E192Series);
    } else {
      _resetRows();
    }
    notifyListeners();
  }

  List _orderOfMagnitudeDifferenceFromBaseSeriesE3toE24(
      num prefValuesIdealInput) {
    int magnitudeDifference = 0;
    num prefValuesIdealInputModify = prefValuesIdealInput;

    while (prefValuesIdealInputModify <= 10) {
      prefValuesIdealInputModify *= 10;
      magnitudeDifference--;
    }

    while (prefValuesIdealInputModify > 100) {
      prefValuesIdealInputModify /= 10;
      magnitudeDifference++;
    }

    return [magnitudeDifference, prefValuesIdealInputModify];
  }

  List _orderOfMagnitudeDifferenceFromBaseSeriesE48toE192(
      num prefValuesIdealInput) {
    int magnitudeDifference = 0;
    num prefValuesIdealInputModify = prefValuesIdealInput;

    while (prefValuesIdealInputModify <= 100) {
      prefValuesIdealInputModify *= 10;
      magnitudeDifference--;
    }

    while (prefValuesIdealInputModify > 1000) {
      prefValuesIdealInputModify /= 10;
      magnitudeDifference++;
    }

    return [magnitudeDifference, prefValuesIdealInputModify];
  }

  num _realValueFromSeries(num prefValuesIdealInput, List<num> series) {
    List magnitudeDifferenceAndPrefValuesIdealInputModify = series.length < 25
        ? _orderOfMagnitudeDifferenceFromBaseSeriesE3toE24(prefValuesIdealInput)
        : _orderOfMagnitudeDifferenceFromBaseSeriesE48toE192(
            prefValuesIdealInput);

    num magnitudeDifference =
        magnitudeDifferenceAndPrefValuesIdealInputModify[0];
    num prefValuesIdealInputModify =
        magnitudeDifferenceAndPrefValuesIdealInputModify[1];
    int positionOfClosestSmallerValue = 0;

    while (prefValuesIdealInputModify > series[positionOfClosestSmallerValue]) {
      if (positionOfClosestSmallerValue == series.length - 1) {
        break;
      }

      positionOfClosestSmallerValue++;
    }

    if (prefValuesIdealInputModify -
            series[positionOfClosestSmallerValue - 1] <=
        series[positionOfClosestSmallerValue] - prefValuesIdealInputModify) {
      return series[positionOfClosestSmallerValue - 1] *
          pow(10, magnitudeDifference);
    }

    return series[positionOfClosestSmallerValue] * pow(10, magnitudeDifference);
  }

  num _countError(num calculatedValue) {
    num prefValueInput = num.parse(_idealInput);
    return (prefValueInput - calculatedValue).abs();
  }

  num _countPercentage(num calculatedValueError) {
    num prefValueInput = num.parse(_idealInput);
    return (calculatedValueError / prefValueInput) * 100;
  }

  void countRow(List<String> row, List<num> series) {
    num calulatedValue = _realValueFromSeries(num.parse(_idealInput), series);
    row[0] = _formatDiplayedValue(calulatedValue);
    row[1] = _formatDiplayedValue(_countError(calulatedValue));
    row[2] = _countPercentage(_countError(calulatedValue)).toStringAsFixed(2);
  }

  String _formatDiplayedValue(num val) {
    if (val == 0) {
      return val.toString();
    } else if (val.abs() < 1e3 && _idealInput.length < 6) {
      return val.toStringAsFixed(3);
    } else {
      return val.toStringAsExponential(2);
    }
  }
}
