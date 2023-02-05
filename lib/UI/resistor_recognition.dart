import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class ResistorRecognitionPage extends StatefulWidget {
  const ResistorRecognitionPage({super.key});

  @override
  State<ResistorRecognitionPage> createState() =>
      _ResistorRecognitionPageState();
}

class _ResistorRecognitionPageState extends State<ResistorRecognitionPage> {
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
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              height: screenHeight * 0.2,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: const Center(
                          child: AutoSizeText(
                            'Resistor recognition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenHeight * 0.01,
                          width: screenWidth * 0.6),
                      Container(
                          color: customColors.secondary,
                          height: screenHeight * 0.085,
                          width: screenWidth * 0.6),
                      SizedBox(
                          height: screenHeight * 0.01,
                          width: screenWidth * 0.6),
                      SizedBox(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.6,
                        child: Center(
                          child: AutoSizeText(
                            "0Ω  ±1%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: customColors.containerResult,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.2),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.53,
                          width: screenWidth * 0.9,
                        ),
                        TollContainerTitleBar(
                            title: "Recognition by color code",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.17,
                          width: screenWidth * 0.9,
                        ),
                        TollContainerTitleBar(
                            title: "Recognition by input value",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
