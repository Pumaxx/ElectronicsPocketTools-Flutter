import 'package:electronic_packet_tools/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'UI_recorces/tool_containers.dart';
import 'UI_recorces/units.dart';

class WaveCalculatorPage extends StatefulWidget {
  const WaveCalculatorPage({super.key});

  @override
  State<WaveCalculatorPage> createState() => _WaveCalculatorPageState();
}

class _WaveCalculatorPageState extends State<WaveCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    Units units = Units();

    return Scaffold(
      backgroundColor: customColors.backgroundTool,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.045),
            SizedBox(
              height: screenHeight * 0.0725,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: const Center(
                      child: AutoSizeText(
                        'Electromagnetic wave parameters',
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
            SizedBox(height: screenHeight * 0.025),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.285,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave frequency',
                                      value: units.frequency,
                                      units: units.frequencyUnits,
                                    ),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave energy',
                                      value: units.energy,
                                      units: units.energyUnits,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.0245,
                                      width: screenWidth * 0.79,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Length | Frequency | Energy',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.285,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave frequency',
                                      value: units.frequency,
                                      units: units.frequencyUnits,
                                    ),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Result',
                                      value: units.speed,
                                      units: units.speedUnits,
                                      color: customColors.containerResult,
                                      enabled: false,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.0245,
                                      width: screenWidth * 0.79,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Speed',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.22,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    DropdownContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Result',
                                      value: units.time,
                                      units: units.timeUnits,
                                      color: customColors.containerResult,
                                      enabled: false,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.0245,
                                      width: screenWidth * 0.79,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Period',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.0275),
          ],
        ),
      ),
    );
  }
}
