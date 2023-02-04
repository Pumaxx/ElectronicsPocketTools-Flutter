import 'package:flutter/material.dart';
import 'main_menu.dart';

class MenuButton extends StatefulWidget {
  final String? buttonText;
  final double? screenHeight;
  final double? screenWidth;
  const MenuButton(
      {Key? key,
      @required this.buttonText,
      @required this.screenHeight,
      @required this.screenWidth})
      : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenHeight! * 0.2,
      width: widget.screenHeight! * 0.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: const Alignment(2.0, 0.2),
          colors: [
            customColors.buttonGradienStart,
            customColors.buttonGradienEnd,
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Flexible(
          child: Text(
            widget.buttonText!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: customColors.main,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.09),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: screenWidth * 0.53,
                  child: const Center(
                    child: Text(
                      "Electronics Pocket Tools",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: screenHeight * 0.075),
            Expanded(
                child: Row(
              children: [
                SizedBox(width: screenWidth * 0.065),
                SizedBox(
                  width: screenWidth * 0.395,
                  child: Column(
                    children: [
                      MenuButton(
                          buttonText: "Register Recognition",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                          buttonText: "Logic Gates Simulator",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                          buttonText: "Preferred Values E series",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.08),
                SizedBox(
                  width: screenWidth * 0.395,
                  child: Column(
                    children: [
                      MenuButton(
                          buttonText: "Wave Parameters Calculator",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                          buttonText: "Digital Filters Realization",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                          buttonText: "Amplification Suppression",
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.065),
              ],
            )),
            SizedBox(height: screenHeight * 0.08)
          ],
        ),
      ),
    );
  }
}
