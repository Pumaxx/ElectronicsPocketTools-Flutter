import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../Business Logic/digital_filters_logic.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class DigitalFiltersPage extends StatefulWidget {
  const DigitalFiltersPage({super.key});

  @override
  State<DigitalFiltersPage> createState() => _DigitalFiltersPageState();
}

class _DigitalFiltersPageState extends State<DigitalFiltersPage> {
  @override
  void initState() {
    super.initState();
    context.read<DigitalFiltersLogic>().resetAll();
  }

  void setFirstParameters(String params) {
    context.read<DigitalFiltersLogic>().setFirstParameters(params);
  }

  void setSecondParameters(String params) {
    context.read<DigitalFiltersLogic>().setSecondParameters(params);
  }

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
                    child: Center(
                      child: AutoSizeText(
                        'Finite impulse response filters parallel / series realization',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.05,
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
                          height: screenHeight * 0.23,
                          width: screenWidth * 0.9,
                          child: InputContainer(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            setParams: setFirstParameters,
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'First filter parameters',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.23,
                          width: screenWidth * 0.9,
                          child: InputContainer(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            setParams: setSecondParameters,
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Second filter parameters',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.265,
                          width: screenWidth * 0.9,
                          child: ResultPanel(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Realization result',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final Function(String value)? setParams;

  const InputContainer(
      {super.key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.setParams});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenHeight! * 0.054,
        ),
        SizedBox(
            height: screenHeight! * 0.13,
            child: Row(
              children: [
                SizedBox(width: screenWidth! * 0.05),
                SizedBox(
                  width: screenWidth! * 0.7875,
                  child: TextField(
                    onChanged: (value) {
                      setParams!(value);
                    },
                    autocorrect: false,
                    enableSuggestions: false,
                    maxLines: null,
                    expands: true,
                    cursorColor: Colors.white,
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: customColors.main),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: customColors.main),
                      ),
                      hintText:
                          'Parameters (dot for decimal separation, for numbers other allowed)',
                      hintStyle: TextStyle(
                        fontSize: screenWidth! * 0.036,
                      ),
                      hintMaxLines: 2,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth! * 0.036,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth! * 0.05),
              ],
            )),
        SizedBox(height: screenHeight! * 0.024),
      ],
    );
  }
}

class ResultPanel extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  const ResultPanel({
    super.key,
    @required this.screenHeight,
    @required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenHeight! * 0.045,
        ),
        SizedBox(
            height: screenHeight! * 0.1835,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight! * 0.045,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: screenWidth! * 0.2),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => customColors.main),
                        value: 1,
                        groupValue: context
                            .watch<DigitalFiltersLogic>()
                            .radioGroupValue,
                        onChanged: (value) {
                          context
                              .read<DigitalFiltersLogic>()
                              .switchRadio(value!);
                        },
                      ),
                      AutoSizeText(
                        'Parallel',
                        style: TextStyle(
                            fontSize: screenWidth! * 0.034,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => customColors.main),
                        value: 2,
                        groupValue: context
                            .watch<DigitalFiltersLogic>()
                            .radioGroupValue,
                        onChanged: (value) {
                          context
                              .read<DigitalFiltersLogic>()
                              .switchRadio(value!);
                        },
                      ),
                      AutoSizeText(
                        'Series',
                        style: TextStyle(
                            fontSize: screenWidth! * 0.034,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: screenWidth! * 0.2),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight! * 0.006,
                ),
                SizedBox(
                  height: screenHeight! * 0.045,
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth! * 0.309),
                      Container(
                        width: screenWidth! * 0.27,
                        decoration: BoxDecoration(
                          color: customColors.containerResult,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<DigitalFiltersLogic>().calculate();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: screenHeight! * 0.016,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth! * 0.309),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight! * 0.01),
                SizedBox(
                  height: screenHeight! * 0.077,
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth! * 0.025),
                      SizedBox(
                        width: screenWidth! * 0.838,
                        child: AutoSizeText(
                          context.watch<DigitalFiltersLogic>().resultText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: context
                                      .watch<DigitalFiltersLogic>()
                                      .errorColor
                                  ? customColors.errorColor
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(width: screenWidth! * 0.025),
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(height: screenHeight! * 0.015),
      ],
    );
  }
}
