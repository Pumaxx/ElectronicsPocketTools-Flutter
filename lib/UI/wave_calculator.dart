import 'package:electronic_packet_tools/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
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
                                    WaveValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    WaveValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave frequency',
                                      value: units.frequency,
                                      units: units.frequencyUnits,
                                    ),
                                    WaveValueContainer(
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
                                    WaveValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    WaveValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave frequency',
                                      value: units.frequency,
                                      units: units.frequencyUnits,
                                    ),
                                    WaveValueContainer(
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
                                    WaveValueContainer(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      label: 'Wave length',
                                      value: units.lenght,
                                      units: units.lenghtUnits,
                                    ),
                                    WaveValueContainer(
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

class WaveValueContainer extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? label;
  String? value;
  final List<String>? units;
  final Color? color;
  final bool? enabled;

  WaveValueContainer(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.label,
      @required this.value,
      @required this.units,
      this.color,
      this.enabled = true})
      : super(key: key);
  @override
  State<WaveValueContainer> createState() => _WaveValueContainerState();
}

class _WaveValueContainerState extends State<WaveValueContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight! * 0.066,
      width: widget.screenWidth! * 0.84,
      child: Row(
        children: [
          SizedBox(
              width: widget.screenWidth! * 0.63,
              child: Column(
                children: [
                  SizedBox(
                    height: widget.screenHeight! * 0.033,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AutoSizeText(
                        widget.label!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.color ?? Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widget.screenHeight! * 0.033,
                    child: TextField(
                      enabled: widget.enabled,
                      maxLines: 1,
                      cursorColor: Colors.white,
                      cursorWidth: 1.5,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        color: widget.color ?? Colors.white,
                        fontSize: widget.screenWidth! * 0.0375,
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
                ],
              )),
          SizedBox(
            width: widget.screenWidth! * 0.21,
            child: Row(
              children: [
                SizedBox(width: widget.screenWidth! * 0.03),
                SizedBox(
                  width: widget.screenWidth! * 0.15,
                  child: Column(
                    children: [
                      SizedBox(height: widget.screenHeight! * 0.022),
                      Container(
                        height: widget.screenHeight! * 0.044,
                        width: widget.screenWidth! * 0.15,
                        decoration: BoxDecoration(
                          color: customColors.containerMainInput,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: DropdownButton(
                            dropdownColor: customColors.containerMainInput,
                            value: widget.value!,
                            underline: Container(),
                            iconSize: widget.screenWidth! * 0.05,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: customColors.main,
                            ),
                            items: widget.units!
                                .map<DropdownMenuItem<String>>((String unit) {
                              return DropdownMenuItem<String>(
                                value: unit,
                                child: AutoSizeText(
                                  unit,
                                  style: TextStyle(
                                    color: customColors.main,
                                    fontSize: widget.screenWidth! * 0.0375,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  widget.value = newValue!;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: widget.screenWidth! * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
