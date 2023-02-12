import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class DigitalFiltersPage extends StatefulWidget {
  const DigitalFiltersPage({super.key});

  @override
  State<DigitalFiltersPage> createState() => _DigitalFiltersPageState();
}

class _DigitalFiltersPageState extends State<DigitalFiltersPage> {
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
                        'Finite impulse response filters parallel / series realization',
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
                          height: screenHeight * 0.23,
                          width: screenWidth * 0.9,
                          child: InputContainer(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
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

  const InputContainer(
      {super.key, @required this.screenHeight, @required this.screenWidth});

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

class ResultPanel extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? text;
  const ResultPanel(
      {super.key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.text = ''});

  @override
  State<ResultPanel> createState() => _ResultPanelState();
}

class _ResultPanelState extends State<ResultPanel> {
  int radioValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.screenHeight! * 0.045,
        ),
        SizedBox(
            height: widget.screenHeight! * 0.1835,
            child: Column(
              children: [
                SizedBox(
                  height: widget.screenHeight! * 0.045,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: widget.screenWidth! * 0.2),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => customColors.main),
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value!;
                            });
                          }),
                      AutoSizeText(
                        'Parallel',
                        style: TextStyle(
                            fontSize: widget.screenWidth! * 0.034,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => customColors.main),
                          value: 2,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value!;
                            });
                          }),
                      AutoSizeText(
                        'Series',
                        style: TextStyle(
                            fontSize: widget.screenWidth! * 0.034,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: widget.screenWidth! * 0.2),
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.screenHeight! * 0.006,
                ),
                SizedBox(
                  height: widget.screenHeight! * 0.045,
                  child: Row(
                    children: [
                      SizedBox(width: widget.screenWidth! * 0.309),
                      Container(
                        width: widget.screenWidth! * 0.27,
                        decoration: BoxDecoration(
                          color: customColors.containerResult,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: widget.screenHeight! * 0.016,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: widget.screenWidth! * 0.309),
                    ],
                  ),
                ),
                SizedBox(height: widget.screenHeight! * 0.01),
                SizedBox(
                  height: widget.screenHeight! * 0.077,
                  child: Row(
                    children: [
                      SizedBox(width: widget.screenWidth! * 0.025),
                      SizedBox(
                        width: widget.screenWidth! * 0.838,
                        child: AutoSizeText(
                          widget.text!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(width: widget.screenWidth! * 0.025),
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(height: widget.screenHeight! * 0.015),
      ],
    );
  }
}
