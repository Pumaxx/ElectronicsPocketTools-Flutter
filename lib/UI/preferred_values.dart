import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Business Logic/preferred_values_logic.dart';
import '../main.dart';
import 'UI_recorces/tool_containers.dart';
import 'package:electronic_packet_tools/Business%20Logic/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PreferredValuesPage extends StatefulWidget {
  const PreferredValuesPage({super.key});

  @override
  State<PreferredValuesPage> createState() => _PreferredValuesPageState();
}

class _PreferredValuesPageState extends State<PreferredValuesPage> {
  late BannerAd _bottomBannerAd;
  bool _idAdLoaded = false;

  void _createdBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: AdHelper.getBannerAdUnitId('series'),
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
    context.read<PreferredValuesLogic>().resetAll();
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
      backgroundColor: customColors.backgroundTool,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.15),
            SizedBox(
              height: screenHeight * 0.0725,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: Center(
                      child: AutoSizeText(
                        'Preferred Values Calculator',
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
            SizedBox(height: screenHeight * 0.07),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.5515,
                          width: screenWidth * 0.9,
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.09,
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              SizedBox(
                                height: screenHeight * 0.4,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.04,
                                    ),
                                    PreferedValuesContent(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.04,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.1,
                          decoration: BoxDecoration(
                            color: customColors.main,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.13),
                              SizedBox(
                                width: screenWidth * 0.32,
                                child: Center(
                                  child: AutoSizeText(
                                    'Enter Ideal Value',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.019,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.22,
                                height: screenHeight * 0.03,
                                child: Center(
                                  child: TextField(
                                    onChanged: (value) {
                                      context
                                          .read<PreferredValuesLogic>()
                                          .setIdealInput(value);
                                      context
                                          .read<PreferredValuesLogic>()
                                          .countPreferredValues();
                                    },
                                    cursorColor: Colors.white,
                                    cursorWidth: 1.5,
                                    maxLines: 1,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d+\.?\d{0,8}')),
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.019,
                                    ),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.23),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.086),
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

class PreferedValuesContent extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  const PreferedValuesContent(
      {Key? key, @required this.screenHeight, @required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth! * 0.807,
      child: Align(
        alignment: Alignment.topCenter,
        child: Table(
          columnWidths: const {
            0: FractionColumnWidth(0.2),
            1: FractionColumnWidth(0.3),
            2: FractionColumnWidth(0.35),
            3: FractionColumnWidth(0.15),
          },
          children: [
            buildRow(
              ['E', 'Value', 'Error Value', 'Err%'],
              isHeader: true,
            ),
            buildRow(context.watch<PreferredValuesLogic>().e3Row,
                eNumber: 'E3'),
            buildRow(context.watch<PreferredValuesLogic>().e6Row,
                eNumber: 'E6'),
            buildRow(context.watch<PreferredValuesLogic>().e12Row,
                eNumber: 'E12'),
            buildRow(context.watch<PreferredValuesLogic>().e24Row,
                eNumber: 'E24'),
            buildRow(context.watch<PreferredValuesLogic>().e48Row,
                eNumber: 'E48'),
            buildRow(context.watch<PreferredValuesLogic>().e96Row,
                eNumber: 'E96'),
            buildRow(context.watch<PreferredValuesLogic>().e192Row,
                eNumber: 'E192'),
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells,
      {String? eNumber, bool isHeader = false}) {
    double fontSize = screenHeight! * 0.0185;

    List<Padding> values = cells.map((text) {
      return Padding(
        padding: isHeader
            ? EdgeInsets.symmetric(vertical: screenHeight! * 0.015)
            : EdgeInsets.symmetric(vertical: screenHeight! * 0.013),
        child: Center(
            child: AutoSizeText(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isHeader ? customColors.main : Colors.white,
            fontSize: fontSize,
          ),
        )),
      );
    }).toList();

    Padding? eValue = eNumber != null
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.013),
            child: Center(
              child: AutoSizeText(
                eNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customColors.containerResult,
                  fontSize: fontSize,
                ),
              ),
            ),
          )
        : null;

    if (eValue != null) {
      values.insert(0, eValue);
    }

    return TableRow(
      children: values,
    );
  }
}
