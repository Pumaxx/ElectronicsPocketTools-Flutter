import 'package:electronic_packet_tools/UI/wave_calculator.dart';
import 'package:flutter/material.dart';
import 'UI/UI_recorces/colors.dart';
import 'UI/amplification_suppression.dart';
import 'UI/digital_filters.dart';
import 'UI/logic_gates.dart';

const customColors = CustomColors();

void main() {
  runApp(const ElectronicsPocketTools());
}

class ElectronicsPocketTools extends StatelessWidget {
  const ElectronicsPocketTools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LogicGatesPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
