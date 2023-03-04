import 'package:auto_size_text/auto_size_text.dart';
import 'package:electronic_packet_tools/Business%20Logic/ad_helper.dart';
import 'package:electronic_packet_tools/UI/preferred_values.dart';
import 'package:electronic_packet_tools/UI/resistor_recognition.dart';
import 'package:electronic_packet_tools/UI/wave_calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../main.dart';
import 'amplification_suppression.dart';
import 'digital_filters.dart';
import 'logic_gates.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BannerAd _bottomBannerAd;
  bool _idAdLoaded = false;

  void _createdBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: AdHelper.getBannerAdUnitId('menu'),
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
  void initState() {
    super.initState();
    _createdBottomBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: customColors.main,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.09),
            SizedBox(
              height: screenHeight * 0.075,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.25),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Center(
                      child: AutoSizeText(
                        'Electronics Pocket Tools',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.05,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.25),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.065),
                SizedBox(
                  width: screenWidth * 0.395,
                  child: Column(
                    children: [
                      MenuButton(
                        buttonText: 'Register Recognition',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const ResistorRecognitionPage(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                        buttonText: 'Logic Gates Simulator',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const LogicGatesPage(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                        buttonText: 'Preferred Values E series',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const PreferredValuesPage(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.08),
                SizedBox(
                  width: screenWidth * 0.395,
                  child: Column(
                    children: [
                      MenuButton(
                        buttonText: 'Wave Parameters Calculator',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const WaveCalculatorPage(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                        buttonText: 'Digital Filters Realization',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const DigitalFiltersPage(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      MenuButton(
                        buttonText: 'Amplification Suppression',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        page: const AmplificationSuppressionPage(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.065),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
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

class MenuButton extends StatelessWidget {
  final String? buttonText;
  final double? screenHeight;
  final double? screenWidth;
  final Widget? page;
  const MenuButton(
      {Key? key,
      @required this.buttonText,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! * 0.2,
      width: screenHeight! * 0.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: const Alignment(2.0, 0.2),
          colors: [
            customColors.buttonGradienStart,
            customColors.buttonGradienEnd,
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return page!;
            }),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenHeight! * 0.01),
          child: AutoSizeText(
            buttonText!,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenHeight! * 0.022,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
