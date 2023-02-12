import 'package:electronic_packet_tools/UI/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI/UI_recorces/colors.dart';

const customColors = CustomColors();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ElectronicsPocketTools());
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
