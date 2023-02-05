import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class PreferredValuesPage extends StatefulWidget {
  const PreferredValuesPage({super.key});

  @override
  State<PreferredValuesPage> createState() => _PreferredValuesPageState();
}

class _PreferredValuesPageState extends State<PreferredValuesPage> {
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
            SizedBox(height: screenHeight * 0.15),
            SizedBox(
              height: screenHeight * 0.0725,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: const Center(
                      child: AutoSizeText(
                        'Preferred Values Calculator',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.2),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.07),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.58,
                          width: screenWidth * 0.9,
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          decoration: BoxDecoration(
                            color: customColors.main,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.13),
                              SizedBox(
                                width: screenWidth * 0.32,
                                child: const Center(
                                  child: AutoSizeText(
                                    "Enter Ideal Value",
                                    maxLines: 1,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.32,
                                child: const AutoSizeText(
                                  "___________________",
                                  maxLines: 1,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.13),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.125),
          ],
        ),
      ),
    );
  }
}
