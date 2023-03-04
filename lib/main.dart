import 'package:electronic_packet_tools/UI/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'Business Logic/amplification_suppression_logic.dart';
import 'Business Logic/digital_filters_logic.dart';
import 'Business Logic/logic_gates_logic.dart';
import 'Business Logic/preferred_values_logic.dart';
import 'Business Logic/resistor_recognition_logic.dart';
import 'Business Logic/wave_calculator_logic.dart';
import 'UI/UI_recorces/colors.dart';

const customColors = CustomColors();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogicGatesLogic()),
        ChangeNotifierProvider(create: (_) => VoltageCurrentLogic()),
        ChangeNotifierProvider(create: (_) => PowerLogic()),
        ChangeNotifierProvider(create: (_) => PreferredValuesLogic()),
        ChangeNotifierProvider(create: (_) => FreqEngLogic()),
        ChangeNotifierProvider(create: (_) => LenEngLogic()),
        ChangeNotifierProvider(create: (_) => PeriodLogic()),
        ChangeNotifierProvider(create: (_) => ResitoRecogntionLogic()),
        ChangeNotifierProvider(create: (_) => DigitalFiltersLogic()),
      ],
      child: const ElectronicsPocketTools(),
    ),
  );
}

class ElectronicsPocketTools extends StatelessWidget {
  const ElectronicsPocketTools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
