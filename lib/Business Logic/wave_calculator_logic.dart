import 'package:electronic_packet_tools/Business%20Logic/utils.dart';
import 'package:electronic_packet_tools/constants.dart';
import 'package:flutter/material.dart';

abstract class WaveCalulatorLogic extends ChangeNotifier {
  void _resetMultipliers() {}

  void _resetValues() {}

  void resetAll() {
    _resetMultipliers();
    _resetValues();
    notifyListeners();
  }
}

class FreqEngLogic extends WaveCalulatorLogic {
  num _lenghtMultiplier = normalMultiplier;
  num _frequencyMultiplier = normalMultiplier;
  num _energyMultiplier = normalMultiplier;

  double _lenght = 0;
  double _frequency = 0;
  double _energy = 0;

  void _calculateLenght() {
    _frequency =
        (speedOfLight / (_lenght * _lenghtMultiplier)) / _frequencyMultiplier;

    _energy = ((planckConstant * speedOfLight * toElectronvolt) /
            (_lenght * _lenghtMultiplier)) /
        _energyMultiplier;
  }

  void setLenghtMultiplier(String unit) {
    _lenghtMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateLenght();
    notifyListeners();
  }

  void setFrequencyMultiplier(String unit) {
    _frequencyMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateLenght();
    notifyListeners();
  }

  void setEnergyMultiplier(String unit) {
    _energyMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateLenght();
    notifyListeners();
  }

  void setLenghtValue(String value) {
    if (Utils.correctInput(value)) {
      _lenght = double.parse(value);
      _calculateLenght();
    } else {
      _resetValues();
    }
    notifyListeners();
  }

  String getFrequency() {
    if (Utils.correctInput(_frequency.toString())) {
      return _frequency.toString();
    } else {
      return '';
    }
  }

  String getEnergy() {
    if (Utils.correctInput(_energy.toString())) {
      return _energy.toString();
    } else {
      return '';
    }
  }

  @override
  void _resetMultipliers() {
    _lenghtMultiplier = normalMultiplier;
    _frequencyMultiplier = normalMultiplier;
    _energyMultiplier = normalMultiplier;
    notifyListeners();
  }

  @override
  void _resetValues() {
    _lenght = 0;
    _frequency = 0;
    _energy = 0;
    notifyListeners();
  }
}

class LenEngLogic extends WaveCalulatorLogic {
  num _lenghtMultiplier = normalMultiplier;
  num _frequencyMultiplier = normalMultiplier;
  num _energyMultiplier = normalMultiplier;

  double _lenght = 0;
  double _frequency = 0;
  double _energy = 0;

  void _calculateFrequency() {
    _lenght = (speedOfLight / (_frequency * _frequencyMultiplier)) /
        _lenghtMultiplier;

    _energy =
        (planckConstant * toElectronvolt * _frequency * _frequencyMultiplier) /
            _energyMultiplier;
  }

  void setLenghtMultiplier(String unit) {
    _lenghtMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateFrequency();
    notifyListeners();
  }

  void setFrequencyMultiplier(String unit) {
    _frequencyMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateFrequency();
    notifyListeners();
  }

  void setEnergyMultiplier(String unit) {
    _energyMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calculateFrequency();
    notifyListeners();
  }

  void setFrequencyValue(String value) {
    if (Utils.correctInput(value)) {
      _frequency = double.parse(value);
      _calculateFrequency();
    } else {
      _resetValues();
    }
    notifyListeners();
  }

  String getLenght() {
    if (Utils.correctInput(_lenght.toString())) {
      return _lenght.toString();
    } else {
      return '';
    }
  }

  String getEnergy() {
    if (Utils.correctInput(_energy.toString())) {
      return _energy.toString();
    } else {
      return '';
    }
  }

  @override
  void _resetMultipliers() {
    _lenghtMultiplier = normalMultiplier;
    _frequencyMultiplier = normalMultiplier;
    _energyMultiplier = normalMultiplier;
    notifyListeners();
  }

  @override
  void _resetValues() {
    _lenght = 0;
    _frequency = 0;
    _energy = 0;
    notifyListeners();
  }
}

class PeriodLogic extends WaveCalulatorLogic {
  num _lenghtMultiplier = normalMultiplier;
  num _periodMultiplier = normalMultiplier;

  double _lenght = 0;
  double _period = 0;

  void _calulatePeriod() {
    _period = (1 / (_lenght * _lenghtMultiplier)) / _periodMultiplier;
    notifyListeners();
  }

  void setLenghtValue(String value) {
    if (Utils.correctInput(value)) {
      _lenght = double.parse(value);
      _calulatePeriod();
    } else {
      _period = 0;
    }
    notifyListeners();
  }

  String getPeriod() {
    if (Utils.correctInput(_period.toString())) {
      return _period.toString();
    } else {
      return '';
    }
  }

  void setLenghtMultiplier(String unit) {
    _lenghtMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calulatePeriod();
    notifyListeners();
  }

  void setPeriodMultiplier(String unit) {
    _periodMultiplier = DropdownMenuLogic.generalDropdown(unit);
    _calulatePeriod();
    notifyListeners();
  }

  @override
  void _resetMultipliers() {
    _lenghtMultiplier = normalMultiplier;
    _periodMultiplier = normalMultiplier;
    notifyListeners();
  }

  @override
  void _resetValues() {
    _lenght = 0;
    _period = 0;
    notifyListeners();
  }
}
