import 'package:flutter/material.dart';
import 'main_menu.dart';

class MenuButton extends StatefulWidget {
  final String? buttonText;
  const MenuButton({Key? key, @required this.buttonText}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: 160.0,
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
    return Scaffold(
      backgroundColor: customColors.main,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            const SizedBox(height: 70.0),
            Row(
              children: const [
                Expanded(child: SizedBox()),
                SizedBox(
                  width: 220.0,
                  child: Center(
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
                Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 60.0),
            Expanded(
                child: Row(
              children: [
                const SizedBox(
                  width: 30.0,
                ),
                Column(
                  children: const [
                    MenuButton(buttonText: "Register Recognition"),
                    SizedBox(height: 30.0),
                    MenuButton(buttonText: "Logic Gates Simulator"),
                    SizedBox(height: 30.0),
                    MenuButton(buttonText: "Preferred Values E series"),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  children: const [
                    MenuButton(buttonText: "Wave Parameters Calculator"),
                    SizedBox(height: 30.0),
                    MenuButton(buttonText: "Digital Filters Realization"),
                    SizedBox(height: 30.0),
                    MenuButton(buttonText: "Amplification Suppression"),
                  ],
                ),
                const SizedBox(
                  width: 30.0,
                ),
              ],
            )),
            const SizedBox(height: 65.0)
          ],
        ),
      ),
    );
  }
}
