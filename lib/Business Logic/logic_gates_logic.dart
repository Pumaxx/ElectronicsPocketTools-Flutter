import 'package:flutter/material.dart';
import 'package:electronic_packet_tools/constants.dart';

class LogicGatesLogic extends ChangeNotifier {
  String _andOutput = '0';
  String _nandOutput = '1';
  String _orOutput = '0';
  String _norOutput = '1';
  String _xorOutput = '0';
  String _xnorOutput = '1';

  void resetOutputs() {
    _andOutput = '0';
    _nandOutput = '1';
    _orOutput = '0';
    _norOutput = '1';
    _xorOutput = '0';
    _xnorOutput = '1';
  }

  String onPress(String value) {
    if (value == '0') {
      return '1';
    }
    return '0';
  }

  String getOutput(String gateType) {
    switch (gateType) {
      case AND_GATE:
        return _andOutput;
      case NAND_GATE:
        return _nandOutput;
      case OR_GATE:
        return _orOutput;
      case NOR_GATE:
        return _norOutput;
      case XOR_GATE:
        return _xorOutput;
      case XNOR_GATE:
        return _xnorOutput;
      default:
        return 'x';
    }
  }

  void countResult(List<String> inputs, String gateType) {
    switch (gateType) {
      case AND_GATE:
        andGate(inputs);
        break;
      case NAND_GATE:
        nandGate(inputs);
        break;
      case OR_GATE:
        orGate(inputs);
        break;
      case NOR_GATE:
        norGate(inputs);
        break;
      case XOR_GATE:
        xorGate(inputs);
        break;
      case XNOR_GATE:
        xnorGate(inputs);
        break;
    }
    notifyListeners();
  }

  void andGate(List<String> inputs) {
    if (inputs[0] == '1' && inputs[1] == '1') {
      _andOutput = '1';
    } else {
      _andOutput = '0';
    }
  }

  void nandGate(List<String> inputs) {
    if (inputs[0] == '1' && inputs[1] == '1') {
      _nandOutput = '0';
    } else {
      _nandOutput = '1';
    }
  }

  void orGate(List<String> inputs) {
    if (inputs[0] == '1' || inputs[1] == '1') {
      _orOutput = '1';
    } else {
      _orOutput = '0';
    }
  }

  void norGate(List<String> inputs) {
    if (inputs[0] == '1' || inputs[1] == '1') {
      _norOutput = '0';
    } else {
      _norOutput = '1';
    }
  }

  void xorGate(List<String> inputs) {
    if (inputs[0] != inputs[1]) {
      _xorOutput = '1';
    } else {
      _xorOutput = '0';
    }
  }

  void xnorGate(List<String> inputs) {
    if (inputs[0] != inputs[1]) {
      _xnorOutput = '0';
    } else {
      _xnorOutput = '1';
    }
  }
}
