import 'package:flutter/material.dart';
import 'colors.dart';
import 'home_page.dart';

const customColors = CustomColors();

class ScreenSize extends StatelessWidget {
  ScreenSize({super.key});

  double? statusBarHeight;
  double? screenHeight;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenHeight = MediaQuery.of(context).size.height - statusBarHeight!;
    screenWidth = MediaQuery.of(context).size.width;
    return const Scaffold();
  }
}

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
