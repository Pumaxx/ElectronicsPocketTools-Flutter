import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class AmplificationSuppressionPage extends StatefulWidget {
  const AmplificationSuppressionPage({super.key});

  @override
  State<AmplificationSuppressionPage> createState() =>
      _AmplificationSuppressionPageState();
}

class _AmplificationSuppressionPageState
    extends State<AmplificationSuppressionPage> {
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
            SizedBox(
              height: screenHeight * 0.0725,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: const Center(
                      child: AutoSizeText(
                        'Amplification and Suppression calculator',
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
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Input',
                                      unit: 'V or A',
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Output',
                                      unit: 'V or A',
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Dimensionless result',
                                      unit: 'V/V or A/A',
                                      color: customColors.containerResult,
                                      enabled: false,
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'dB result',
                                      unit: 'dB',
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
                            title: 'Voltage / Current',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Input',
                                      unit: 'W',
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Output',
                                      unit: 'W',
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Dimensionless result',
                                      unit: 'W/W',
                                      color: customColors.containerResult,
                                      enabled: false,
                                    ),
                                    AmpSuppValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'dB result',
                                      unit: 'dB',
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
                            title: 'Power',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.085),
          ],
        ),
      ),
    );
  }
}

class AmpSuppValueContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? label;
  final String? unit;
  final Color? color;
  final bool? enabled;

  const AmpSuppValueContainer(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.label,
      @required this.unit,
      this.color,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight! * 0.066,
      width: screenWidth! * 0.84,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight! * 0.033,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                label!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color ?? Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight! * 0.033,
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth! * 0.63,
                  child: TextField(
                    cursorColor: Colors.white,
                    cursorWidth: 1.5,
                    enabled: enabled,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(
                      color: color ?? Colors.white,
                      fontSize: screenWidth! * 0.0375,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth! * 0.21,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AutoSizeText(
                      unit!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color ?? Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
