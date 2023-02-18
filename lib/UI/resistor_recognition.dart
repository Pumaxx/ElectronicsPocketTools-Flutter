import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';
import 'UI_recorces/units.dart';

class ResistorRecognitionPage extends StatefulWidget {
  const ResistorRecognitionPage({super.key});

  @override
  State<ResistorRecognitionPage> createState() =>
      _ResistorRecognitionPageState();
}

class _ResistorRecognitionPageState extends State<ResistorRecognitionPage> {
  @override
  void initState() {
    for (int i = 0; i < firstStripeColors.length - 1; i++) {
      firstStripeColors[i] = Colors.black;
      secondStripeColors[i] = Colors.black;
    }
    firstStripeColors[3] = customColors.brown;
    secondStripeColors[3] = customColors.brown;
    super.initState();
  }

  List<Color> firstStripeColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    customColors.brown,
  ];

  List<Color> secondStripeColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    customColors.brown,
  ];

  void setStripeColor(int id, Color color, Color secondColor) {
    setState(() {
      firstStripeColors[id] = color;
      secondStripeColors[id] = secondColor;
    });
  }

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
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.6,
                        child: Stack(
                          children: [
                            const Center(
                              child: Image(
                                image:
                                    AssetImage('resources/images/resistor.png'),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: screenWidth * 0.16),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: firstStripeColors[0],
                                  secondColor: secondStripeColors[0],
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: firstStripeColors[1],
                                  secondColor: secondStripeColors[1],
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: firstStripeColors[2],
                                  secondColor: secondStripeColors[2],
                                ),
                                SizedBox(width: screenWidth * 0.08),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: firstStripeColors[3],
                                  secondColor: secondStripeColors[3],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: Center(
                          child: AutoSizeText(
                            '0Ω  ±1%',
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
                  SizedBox(width: screenWidth * 0.1),
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
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.05),
                              SizedBox(
                                height: screenHeight * 0.438,
                                child: Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.05),
                                    SizedBox(
                                      width: screenWidth * 0.788,
                                      child: Table(
                                        border: TableBorder.all(),
                                        children: [
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: Colors.black,
                                                text: '0',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: Colors.black,
                                                text: '0',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: Colors.black,
                                                text: '1 Ω',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: Colors.black,
                                                enabled: false,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.brown,
                                                text: '1',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.brown,
                                                text: '1',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.brown,
                                                text: '10 Ω',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.brown,
                                                text: '± 1%',
                                                notifyParent: setStripeColor,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.red,
                                                text: '2',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.red,
                                                text: '2',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.red,
                                                text: '100 Ω',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.red,
                                                text: '± 2%',
                                                notifyParent: setStripeColor,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.orange,
                                                text: '3',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.orange,
                                                text: '3',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.orange,
                                                text: '1 kΩ',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.orange,
                                                enabled: false,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.yellow,
                                                text: '4',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.yellow,
                                                text: '4',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.yellow,
                                                text: '10 kΩ',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.yellow,
                                                enabled: false,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.green,
                                                text: '5',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.green,
                                                text: '5',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.green,
                                                text: '100 kΩ',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.green,
                                                text: '± 0.50%',
                                                notifyParent: setStripeColor,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.blue,
                                                text: '6',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.blue,
                                                text: '6',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.blue,
                                                text: '1 MΩ',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.blue,
                                                text: '± 0.25%',
                                                notifyParent: setStripeColor,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.purple,
                                                text: '7',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.purple,
                                                text: '7',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.purple,
                                                text: '10 MΩ',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.purple,
                                                text: '± 0.10%',
                                                notifyParent: setStripeColor,
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: customColors.grey,
                                                text: '8',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.grey,
                                                text: '8',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.grey,
                                                text: '100 MΩ',
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                text: '± 0.5%',
                                                notifyParent: setStripeColor,
                                                color: const Color(0xFFf37835),
                                                secondColor:
                                                    const Color(0xFFfcd453),
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 0,
                                                color: Colors.white,
                                                text: '9',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: Colors.white,
                                                text: '9',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: Colors.white,
                                                text: '1 GΩ',
                                                lightBackground: true,
                                                notifyParent: setStripeColor,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                text: '± 10%',
                                                notifyParent: setStripeColor,
                                                color: const Color(0xFF3b3b3b),
                                                secondColor:
                                                    const Color(0xFFfafafa),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.05),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Recognition by color code',
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
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.03),
                              SizedBox(
                                height: screenHeight * 0.1088,
                                child: Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.035),
                                    SizedBox(
                                      width: screenWidth * 0.848,
                                      child: DropdownContainer(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        label: 'Input',
                                        value: units.resistance,
                                        units: units.resistanceUnits,
                                        getResult: () {
                                          return 'Number between 0-99';
                                        },
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.005),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Recognition by input value',
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

class ResistorStripe extends StatelessWidget {
  final double? screenWidth;
  final Color? color;
  final Color? secondColor;
  const ResistorStripe({
    Key? key,
    @required this.color,
    @required this.screenWidth,
    @required this.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.6),
          colors: [
            color!,
            secondColor!,
          ],
        ),
      ),
      width: screenWidth! * 0.025,
    );
  }
}

class ResistorButton extends StatefulWidget {
  final double? screenHeight;
  final int? id;
  final Function(int id, Color color, Color secondColor)? notifyParent;
  final Color? color;
  final Color? secondColor;
  final String? text;
  final bool? enabled;
  final bool? lightBackground;
  const ResistorButton({
    Key? key,
    @required this.screenHeight,
    @required this.id,
    this.notifyParent,
    @required this.color,
    this.secondColor,
    this.text = '',
    this.enabled = true,
    this.lightBackground = false,
  }) : super(key: key);

  @override
  State<ResistorButton> createState() => _ResistorButtonState();
}

class _ResistorButtonState extends State<ResistorButton> {
  @override
  Widget build(BuildContext context) {
    Color? gradientColor = widget.secondColor ?? widget.color;

    return Container(
      height: widget.screenHeight! * 0.0438,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.6),
          colors: [
            widget.color!,
            gradientColor!,
          ],
        ),
      ),
      child: TextButton(
        onPressed: widget.enabled!
            ? () {
                setState(() {
                  widget.notifyParent!(
                      widget.id!, widget.color!, gradientColor);
                });
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor:
              widget.lightBackground! ? customColors.grey : Colors.white,
        ),
        child: Text(
          widget.text!,
          style: TextStyle(
            fontSize: widget.screenHeight! * 0.016,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
