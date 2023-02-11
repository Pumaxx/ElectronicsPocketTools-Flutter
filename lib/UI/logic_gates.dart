import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class LogicGatesPage extends StatefulWidget {
  const LogicGatesPage({super.key});

  @override
  State<LogicGatesPage> createState() => _LogicGatesPageState();
}

class _LogicGatesPageState extends State<LogicGatesPage> {
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
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.88,
                          width: screenWidth * 0.9,
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.06,
                              ),
                              SizedBox(
                                height: screenHeight * 0.786,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.8279,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: false,
                                              title: 'AND',
                                              image:
                                                  'resources/images/and_gate.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: true,
                                              title: 'NAND',
                                              image:
                                                  'resources/images/nand_gate.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: false,
                                              title: 'OR',
                                              image:
                                                  'resources/images/or_gate.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: true,
                                              title: 'NOR',
                                              image:
                                                  'resources/images/nor_gate.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: false,
                                              title: 'XOR',
                                              image:
                                                  'resources/images/xor_gate.png',
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.131,
                                            child: GateRow(
                                              screenHeight: screenHeight,
                                              screenWidth: screenWidth,
                                              isReversed: true,
                                              title: 'XNOR',
                                              image:
                                                  'resources/images/xnor_gate.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.0125,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            color: customColors.main,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: const AutoSizeText(
                                'Logic Gates Simulator',
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}

class GateContainer extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? image;
  const GateContainer(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.image})
      : super(key: key);

  @override
  State<GateContainer> createState() => _GateContainerState();
}

class _GateContainerState extends State<GateContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth! * 0.5380,
      child: Row(
        children: [
          SizedBox(
            width: widget.screenWidth! * 0.02,
          ),
          SizedBox(
            width: widget.screenWidth! * 0.085,
            child: Column(
              children: [
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085) * 2) /
                      3,
                ),
                GateButton(
                  screenHeight: widget.screenHeight!,
                  screenWidth: widget.screenWidth!,
                ),
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085) * 2) /
                      3,
                ),
                GateButton(
                  screenHeight: widget.screenHeight!,
                  screenWidth: widget.screenWidth!,
                ),
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085) * 2) /
                      3,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: widget.screenWidth! * 0.328,
              child: Image(
                image: AssetImage(widget.image!),
              ),
            ),
          ),
          SizedBox(
            width: widget.screenWidth! * 0.085,
            child: Column(
              children: [
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085)) /
                      2,
                ),
                GateButton(
                  screenHeight: widget.screenHeight!,
                  screenWidth: widget.screenWidth!,
                  isResult: true,
                ),
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085)) /
                      2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: widget.screenWidth! * 0.02,
          ),
        ],
      ),
    );
  }
}

class GateNameContainer extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? title;
  const GateNameContainer(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth! * 0.2898,
      child: Center(
        child: AutoSizeText(
          title!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: customColors.backgroundTool,
              fontSize: screenHeight! * 0.03),
        ),
      ),
    );
  }
}

class GateRow extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final bool? isReversed;
  final String? title;
  final String? image;
  const GateRow(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.isReversed,
      @required this.title,
      @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isReversed!) {
      return Row(
        children: [
          GateNameContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            title: title,
          ),
          GateContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            image: image,
          ),
        ],
      );
    }

    return Row(
      children: [
        GateContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          image: image,
        ),
        GateNameContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          title: title,
        ),
      ],
    );
  }
}

class GateButton extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final bool? isResult;
  const GateButton(
      {Key? key,
      @required this.screenHeight,
      @required this.screenWidth,
      this.isResult = false})
      : super(key: key);

  @override
  State<GateButton> createState() => _GateButtonState();
}

class _GateButtonState extends State<GateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth! * 0.085,
      decoration: BoxDecoration(
        color:
            widget.isResult! ? customColors.containerResult : customColors.main,
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: TextButton(
        onPressed: widget.isResult! ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.white,
        ),
        child: Text(
          '0',
          style: TextStyle(
            fontSize: widget.screenHeight! * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
