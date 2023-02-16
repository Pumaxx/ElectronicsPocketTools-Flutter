abstract class Utils {
  static bool isNumeric(string) => num.tryParse(string) != null;
  static bool correctInput(String input) {
    return isNumeric(input) && input.isNotEmpty && num.parse(input) != 0;
  }
}
