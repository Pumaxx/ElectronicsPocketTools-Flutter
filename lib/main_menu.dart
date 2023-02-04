import 'package:flutter/material.dart';
import 'colors.dart';
import 'home_page.dart';

const customColors = CustomColors();

void main() {
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
