import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Business Logic/resistor_recognition_logic.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';
import 'UI_recorces/units.dart';
import 'package:electronic_packet_tools/Business%20Logic/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ResistorRecognitionPage extends StatefulWidget {
  const ResistorRecognitionPage({super.key});

  @override
  State<ResistorRecognitionPage> createState() =>
      _ResistorRecognitionPageState();
}

class _ResistorRecognitionPageState extends State<ResistorRecognitionPage> {
  late BannerAd _bottomBannerAd;
  bool _idAdLoaded = false;

  void _createdBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _idAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: AdRequest(),
    );
    _bottomBannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  void initState() {
    super.initState();
    _createdBottomBannerAd();
    context.read<ResitoRecogntionLogic>().resetAll();
  }

  void calculate(int index, Color firstcolor, Color secondColor, String text) {
    context
        .read<ResitoRecogntionLogic>()
        .calculate(index, firstcolor, secondColor, text);
  }

  void setDropdownMultiplyer(String unit) {
    context.read<ResitoRecogntionLogic>().setDropdownMultiplyer(unit);
  }

  void inputValue(String value) {
    context.read<ResitoRecogntionLogic>().inputValue(value);
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
            SizedBox(height: screenHeight * 0.045),
            SizedBox(
              height: screenHeight * 0.175,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Center(
                          child: AutoSizeText(
                            'Resistor recognition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.05,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
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
                                  color: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeFirstColor(index: 0),
                                  secondColor: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeSecondColor(index: 0),
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeFirstColor(index: 1),
                                  secondColor: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeSecondColor(index: 1),
                                ),
                                SizedBox(width: screenWidth * 0.04),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeFirstColor(index: 2),
                                  secondColor: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeSecondColor(index: 2),
                                ),
                                SizedBox(width: screenWidth * 0.08),
                                ResistorStripe(
                                  screenWidth: screenWidth,
                                  color: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeFirstColor(index: 3),
                                  secondColor: context
                                      .watch<ResitoRecogntionLogic>()
                                      .getStripeSecondColor(index: 3),
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
                            context.watch<ResitoRecogntionLogic>().result,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.029,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: Colors.black,
                                                text: '0',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: Colors.black,
                                                text: '1 Ω',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.brown,
                                                text: '1',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.brown,
                                                text: '10 Ω',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.brown,
                                                text: '± 1%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.red,
                                                text: '2',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.red,
                                                text: '100 Ω',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.red,
                                                text: '± 2%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.orange,
                                                text: '3',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.orange,
                                                text: '1 kΩ',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.yellow,
                                                text: '4',
                                                lightBackground: true,
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.yellow,
                                                text: '10 kΩ',
                                                lightBackground: true,
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.green,
                                                text: '5',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.green,
                                                text: '100 kΩ',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.green,
                                                text: '± 0.50%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.blue,
                                                text: '6',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.blue,
                                                text: '1 MΩ',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.blue,
                                                text: '± 0.25%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.purple,
                                                text: '7',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.purple,
                                                text: '10 MΩ',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                color: customColors.purple,
                                                text: '± 0.10%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: customColors.grey,
                                                text: '8',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: customColors.grey,
                                                text: '100 MΩ',
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                text: '± 5%',
                                                calculate: calculate,
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
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 1,
                                                color: Colors.white,
                                                text: '9',
                                                lightBackground: true,
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 2,
                                                color: Colors.white,
                                                text: '1 GΩ',
                                                lightBackground: true,
                                                calculate: calculate,
                                              ),
                                              ResistorButton(
                                                screenHeight: screenHeight,
                                                id: 3,
                                                text: '± 10%',
                                                calculate: calculate,
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
                    SizedBox(height: screenHeight * 0.01),
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
                                        textInputFormatter: <
                                            TextInputFormatter>[
                                          LengthLimitingTextInputFormatter(2),
                                        ],
                                        getResult: () {
                                          return 'Number between 0-99';
                                        },
                                        setDropdownValue: setDropdownMultiplyer,
                                        setInputValue: inputValue,
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
            SizedBox(height: screenHeight * 0.0005),
            Container(
              height: screenHeight * 0.07,
              child: AdWidget(ad: _bottomBannerAd),
            ),
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

class ResistorButton extends StatelessWidget {
  final double? screenHeight;
  final int? id;
  final Function(int index, Color color, Color secondColor, String text)?
      calculate;
  final Color? color;
  final Color? secondColor;
  final String? text;
  final bool? enabled;
  final bool? lightBackground;
  const ResistorButton({
    Key? key,
    @required this.screenHeight,
    @required this.id,
    this.calculate,
    @required this.color,
    this.secondColor,
    this.text = '',
    this.enabled = true,
    this.lightBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? gradientColor = secondColor ?? color;

    return Container(
      height: screenHeight! * 0.0438,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.6),
          colors: [
            color!,
            gradientColor!,
          ],
        ),
      ),
      child: TextButton(
        onPressed: enabled!
            ? () {
                calculate!(id!, color!, gradientColor, text!);
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: lightBackground! ? customColors.grey : Colors.white,
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: screenHeight! * 0.016,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
