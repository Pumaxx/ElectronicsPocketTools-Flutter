import 'dart:math';

import 'package:electronic_packet_tools/Business%20Logic/utils.dart';
import 'package:flutter/material.dart';

class AmpSuppLogic extends ChangeNotifier {
  int _base = 0;
  List<String> _inputs = ['', ''];
  List<String> _outputs = ['', ''];

  String getOutput(int index) {
    return _outputs[index];
  }

  void changeInput(int index, String value) {
    _inputs[index] = value;
    notifyListeners();
  }

  void resetFields() {
    _outputs = ['', ''];
    _inputs = ['', ''];
    notifyListeners();
  }

  void countResults() {
    debugPrint("1: ${_inputs[0].isNotEmpty}");
    debugPrint("2: ${_inputs[1].isNotEmpty}");

    if (_correctInput(_inputs[0]) && _correctInput(_inputs[1])) {
      num firstInput = num.parse(_inputs[0]);
      num secondInput = num.parse(_inputs[1]);

      num dimLessResult = firstInput / secondInput;
      num dbResult = _base * log(dimLessResult) / ln10;

      _outputs[0] = dimLessResult.toString();
      _outputs[1] = dbResult.toString();
    } else {
      _outputs = ['', ''];
    }
    notifyListeners();
  }

  bool _correctInput(String input) {
    return Utils.isNumeric(input) && input.isNotEmpty && num.parse(input) != 0;
  }
}

class VoltageCurrentLogic extends AmpSuppLogic {
  VoltageCurrentLogic() {
    _base = 20;
  }
}

class PowerLogic extends AmpSuppLogic {
  PowerLogic() {
    _base = 10;
  }
}
