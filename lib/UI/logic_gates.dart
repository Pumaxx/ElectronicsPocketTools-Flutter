import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class LogicGatesPage extends StatefulWidget {
  const LogicGatesPage({super.key});

  @override
  State<LogicGatesPage> createState() => _LogicGatesPageState();
}

class _LogicGatesPageState extends State<LogicGatesPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: customColors.backgroundTool,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.07),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.88,
                          width: screenWidth * 0.9,
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            color: customColors.main,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: const AutoSizeText(
                                "Logic Gates Simulator",
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
