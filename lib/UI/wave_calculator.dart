import 'package:electronic_packet_tools/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../Business Logic/wave_calculator_logic.dart';
import 'UI_recorces/tool_containers.dart';
import 'UI_recorces/units.dart';
import 'package:electronic_packet_tools/Business%20Logic/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Units units = Units();

class WaveCalculatorPage extends StatefulWidget {
  const WaveCalculatorPage({super.key});

  @override
  State<WaveCalculatorPage> createState() => _WaveCalculatorPageState();
}

class _WaveCalculatorPageState extends State<WaveCalculatorPage> {
  late BannerAd _bottomBannerAd;
  bool _idAdLoaded = false;

  void _createdBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: AdHelper.getBannerAdUnitId('wave'),
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
    context.read<FreqEngLogic>().resetAll();
    context.read<LenEngLogic>().resetAll();
    context.read<PeriodLogic>().resetAll();
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
            SizedBox(height: screenHeight * 0.0345),
            SizedBox(
              height: screenHeight * 0.07,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: Center(
                      child: AutoSizeText(
                        'Electromagnetic wave parameters',
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
            SizedBox(height: screenHeight * 0.015),
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
                                child: FreqEng(
                                  context: context,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Frequency | Energy',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
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
                                child: LenEng(
                                  context: context,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                            ],
                          ),
                        ),
                        TollContainerTitleBar(
                            title: 'Length | Energy',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
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
                                    PeriodInput(
                                      context: context,
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                    ),
                                    PeriodResult(
                                      context: context,
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
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

class FreqEng extends StatelessWidget {
  final BuildContext? context;
  final double? screenHeight;
  final double? screenWidth;
  FreqEng(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.context})
      : super(key: key) {}

  void setLenghtValue(String value) {
    context!.read<FreqEngLogic>().setLenghtValue(value);
  }

  void setLenghtMultiplier(String unit) {
    context!.read<FreqEngLogic>().setLenghtMultiplier(unit);
  }

  void setFrequencyMultiplier(String unit) {
    context!.read<FreqEngLogic>().setFrequencyMultiplier(unit);
  }

  String getFrequency() {
    return context!.watch<FreqEngLogic>().getFrequency();
  }

  void setEnergyMultiplier(String unit) {
    context!.read<FreqEngLogic>().setEnergyMultiplier(unit);
  }

  String getEnergy() {
    return context!.watch<FreqEngLogic>().getEnergy();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight! * 0.04),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave length',
          value: units.lenght,
          units: units.lenghtUnits,
          getResult: () {},
          setInputValue: setLenghtValue,
          setDropdownValue: setLenghtMultiplier,
        ),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave frequency',
          value: units.frequency,
          units: units.frequencyUnits,
          color: customColors.containerResult,
          enabled: false,
          getResult: getFrequency,
          setDropdownValue: setFrequencyMultiplier,
        ),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave energy',
          value: units.energy,
          units: units.energyUnits,
          color: customColors.containerResult,
          enabled: false,
          getResult: getEnergy,
          setDropdownValue: setEnergyMultiplier,
        ),
        SizedBox(
          height: screenHeight! * 0.0245,
        ),
      ],
    );
  }
}

class LenEng extends StatelessWidget {
  final BuildContext? context;
  final double? screenHeight;
  final double? screenWidth;
  LenEng(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.context})
      : super(key: key) {}

  void setFrequencyValue(String value) {
    context!.read<LenEngLogic>().setFrequencyValue(value);
  }

  void setLenghtMultiplier(String unit) {
    context!.read<LenEngLogic>().setLenghtMultiplier(unit);
  }

  void setFrequencyMultiplier(String unit) {
    context!.read<LenEngLogic>().setFrequencyMultiplier(unit);
  }

  void setEnergyMultiplier(String unit) {
    context!.read<LenEngLogic>().setEnergyMultiplier(unit);
  }

  String getLenght() {
    return context!.watch<LenEngLogic>().getLenght();
  }

  String getEnergy() {
    return context!.watch<LenEngLogic>().getEnergy();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight! * 0.04),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave frequency',
          value: units.frequency,
          units: units.frequencyUnits,
          getResult: () {},
          setInputValue: setFrequencyValue,
          setDropdownValue: setFrequencyMultiplier,
        ),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave length',
          value: units.lenght,
          units: units.lenghtUnits,
          color: customColors.containerResult,
          enabled: false,
          getResult: getLenght,
          setDropdownValue: setLenghtMultiplier,
        ),
        DropdownContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          label: 'Wave energy',
          value: units.energy,
          units: units.energyUnits,
          color: customColors.containerResult,
          enabled: false,
          getResult: getEnergy,
          setDropdownValue: setEnergyMultiplier,
        ),
        SizedBox(
          height: screenHeight! * 0.0245,
        ),
      ],
    );
  }
}

class PeriodInput extends StatelessWidget {
  final BuildContext? context;
  final double? screenHeight;
  final double? screenWidth;
  const PeriodInput(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.context})
      : super(key: key);

  void setLenghtMultiplier(String unit) {
    context!.read<PeriodLogic>().setLenghtMultiplier(unit);
  }

  void setLenghtValue(String value) {
    context!.read<PeriodLogic>().setLenghtValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownContainer(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      label: 'Wave length',
      value: units.lenght,
      units: units.lenghtUnits,
      setDropdownValue: setLenghtMultiplier,
      setInputValue: setLenghtValue,
      getResult: () {},
    );
  }
}

class PeriodResult extends StatelessWidget {
  final BuildContext? context;
  final double? screenHeight;
  final double? screenWidth;
  const PeriodResult(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.context})
      : super(key: key);

  void setPeriodMultiplier(String unit) {
    context!.read<PeriodLogic>().setPeriodMultiplier(unit);
  }

  String getPeriod() {
    return context!.watch<PeriodLogic>().getPeriod();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownContainer(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      label: 'Result',
      value: units.time,
      units: units.timeUnits,
      color: customColors.containerResult,
      enabled: false,
      setDropdownValue: setPeriodMultiplier,
      getResult: getPeriod,
    );
  }
}
