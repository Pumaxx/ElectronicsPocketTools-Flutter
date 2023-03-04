import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Business Logic/amplification_suppression_logic.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';
import 'package:electronic_packet_tools/Business%20Logic/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AmplificationSuppressionPage extends StatefulWidget {
  const AmplificationSuppressionPage({super.key});

  @override
  State<AmplificationSuppressionPage> createState() =>
      _AmplificationSuppressionPageState();
}

class _AmplificationSuppressionPageState
    extends State<AmplificationSuppressionPage> {
  late BannerAd _bottomBannerAd;
  bool _idAdLoaded = false;

  void _createdBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: AdHelper.getBannerAdUnitId('amp'),
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
    context.read<VoltageCurrentLogic>().resetFields();
    context.read<PowerLogic>().resetFields();
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
                        'Amplification and Suppression calculator',
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
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.035),
                              SizedBox(
                                width: screenWidth * 0.84,
                                child: VoltCurrContainer(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
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
                                child: PowerContainer(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
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
            SizedBox(height: screenHeight * 0.016),
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

class VoltCurrContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  const VoltCurrContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight! * 0.04),
        AmpSuppInputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Input',
          unit: 'V or A',
          index: 0,
        ),
        AmpSuppInputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Output',
          unit: 'V or A',
          index: 1,
        ),
        AmpSuppOutputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Dimensionless result',
          unit: 'V/V or A/A',
          index: 0,
        ),
        AmpSuppOutputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'dB result',
          unit: 'dB',
          index: 1,
        ),
        SizedBox(
          height: screenHeight! * 0.0245,
          width: screenWidth! * 0.79,
        ),
      ],
    );
  }
}

class PowerContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  const PowerContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight! * 0.04),
        AmpSuppInputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Input',
          unit: 'W',
          index: 0,
          isPower: true,
        ),
        AmpSuppInputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Output',
          unit: 'W',
          index: 1,
          isPower: true,
        ),
        AmpSuppOutputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'Dimensionless result',
          unit: 'W/W',
          index: 0,
          isPowerContainer: true,
        ),
        AmpSuppOutputContainer(
          screenHeight: screenHeight!,
          screenWidth: screenWidth!,
          label: 'dB result',
          unit: 'dB',
          index: 1,
          isPowerContainer: true,
        ),
        SizedBox(
          height: screenHeight! * 0.0245,
          width: screenWidth! * 0.79,
        ),
      ],
    );
  }
}

class AmpSuppInputContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? label;
  final String? unit;
  final int? index;
  final bool? isPower;

  const AmpSuppInputContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.label,
    @required this.unit,
    @required this.index,
    this.isPower = false,
  }) : super(key: key);

  void calculateOutputs(BuildContext context, bool isPower, String value) {
    if (isPower) {
      context.read<PowerLogic>().changeInput(index!, value);
      context.read<PowerLogic>().countResults();
    } else {
      context.read<VoltageCurrentLogic>().changeInput(index!, value);
      context.read<VoltageCurrentLogic>().countResults();
    }
  }

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
                  color: Colors.white,
                  fontSize: screenHeight! * 0.019,
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
                    onChanged: (value) {
                      calculateOutputs(context, isPower!, value);
                    },
                    cursorColor: Colors.white,
                    cursorWidth: 1.5,
                    maxLines: 1,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,25}')),
                      LengthLimitingTextInputFormatter(27),
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight! * 0.019,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

class AmpSuppOutputContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? label;
  final String? unit;
  final int? index;
  final bool? isPowerContainer;

  const AmpSuppOutputContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.label,
    @required this.unit,
    @required this.index,
    this.isPowerContainer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String output = isPowerContainer!
        ? context.watch<PowerLogic>().getOutput(index!)
        : context.watch<VoltageCurrentLogic>().getOutput(index!);
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
                  color: customColors.containerResult,
                  fontSize: screenHeight! * 0.019,
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
                    enabled: false,
                    maxLines: 1,
                    style: TextStyle(
                      color: customColors.containerResult,
                      fontSize: screenHeight! * 0.019,
                    ),
                    decoration: InputDecoration(
                      hintText: output,
                      hintStyle: TextStyle(
                        color: customColors.containerResult,
                        fontSize: screenHeight! * 0.019,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
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
                        color: customColors.containerResult,
                        fontSize: screenHeight! * 0.019,
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
