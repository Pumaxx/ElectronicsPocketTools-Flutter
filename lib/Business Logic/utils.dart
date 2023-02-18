import '../constants.dart';

abstract class Utils {
  static bool isNumeric(string) => num.tryParse(string) != null;
  static bool correctInput(String input) {
    return isNumeric(input) && input.isNotEmpty && num.parse(input) != 0;
  }
}

abstract class DropdownMenuLogic {
  static num generalDropdown(String type) {
    switch (type[0]) {
      case 'n':
        return nano;
      case 'μ':
        return micro;
      case 'm':
        if (type.length > 1) {
          return milli;
        }
        continue normal;
      case 'c':
        return cent;
      case 'k':
        return kilo;
      case 'M':
        return mega;
      case 'G':
        return giga;
      case 'T':
        return tera;
      normal:
      default:
        return normalMultiplier;
    }
  }

  static num speedDropdown(String type) {
    switch (type) {
      case 'cm/s':
        return msTocs;
      case 'm/s':
        return normalMultiplier;
      case 'km/h':
        return msTokmh;
      default:
        return normalMultiplier;
    }
  }
}
