import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class PreferredValuesPage extends StatefulWidget {
  const PreferredValuesPage({super.key});

  @override
  State<PreferredValuesPage> createState() => _PreferredValuesPageState();
}

class _PreferredValuesPageState extends State<PreferredValuesPage> {
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
                    child: const Center(
                      child: AutoSizeText(
                        'Preferred Values Calculator',
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
                                child: const Center(
                                  child: AutoSizeText(
                                    "Enter Ideal Value",
                                    maxLines: 1,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.22,
                                height: screenHeight * 0.03,
                                child: Center(
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    cursorWidth: 1.5,
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.0375,
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
            SizedBox(height: screenHeight * 0.125),
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
            buildRow(['470', '520', '90%'], eNumber: "E3"),
            buildRow(['470', '520', '90%'], eNumber: 'E6'),
            buildRow(['470', '520', '90%'], eNumber: 'E12'),
            buildRow(['470', '520', '90%'], eNumber: 'E24'),
            buildRow(['470', '520', '90%'], eNumber: 'E48'),
            buildRow(['470', '520', '90%'], eNumber: 'E96'),
            buildRow(['470', '520', '90%'], eNumber: 'E192'),
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
