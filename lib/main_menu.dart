import 'package:electronic_packet_tools/UI/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Business Logic/amplification_suppression_logic.dart';
import 'Business Logic/logic_gates_logic.dart';
import 'Business Logic/preferred_values_logic.dart';
import 'UI/UI_recorces/colors.dart';

const customColors = CustomColors();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogicGatesLogic()),
        ChangeNotifierProvider(create: (_) => VoltageCurrentLogic()),
        ChangeNotifierProvider(create: (_) => PowerLogic()),
        ChangeNotifierProvider(create: (_) => PreferredValuesLogic()),
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
