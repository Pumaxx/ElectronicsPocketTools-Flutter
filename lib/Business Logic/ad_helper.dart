import 'dart:io';

class AdHelper {
  static String getBannerAdUnitId(String place) {
    if (Platform.isAndroid) {
      return androidAdUnits[place]!;
    } else if (Platform.isIOS) {
      return iosAdUnits[place]!;
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static final Map<String, String> androidAdUnits = {
    'menu': 'ca-app-pub-8909409495248630/7007846575',
    'resistor': 'ca-app-pub-8909409495248630/6438383829',
    'wave': 'ca-app-pub-8909409495248630/9346799959',
    'gate': 'ca-app-pub-8909409495248630/2499138816',
    'filter': 'ca-app-pub-8909409495248630/1186057147',
    'series': 'ca-app-pub-8909409495248630/9399040343',
    'amp': 'ca-app-pub-8909409495248630/7559893808',
  };

  static final Map<String, String> iosAdUnits = {
    'menu': 'ca-app-pub-8909409495248630/4933730467',
    'resistor': 'ca-app-pub-8909409495248630/1276738248',
    'wave': 'ca-app-pub-8909409495248630/9697319590',
    'gate': 'ca-app-pub-8909409495248630/8681403787',
    'filter': 'ca-app-pub-8909409495248630/6055240445',
    'series': 'ca-app-pub-8909409495248630/3429077103',
    'amp': 'ca-app-pub-8909409495248630/2115995437',
  };
}
