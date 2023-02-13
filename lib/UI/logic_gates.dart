import 'package:electronic_packet_tools/Business%20Logic/logic_gates_logic.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class LogicGatesPage extends StatefulWidget {
  const LogicGatesPage({super.key});

  @override
  State<LogicGatesPage> createState() => _LogicGatesPageState();
}

class _LogicGatesPageState extends State<LogicGatesPage> {
  @override
  void initState() {
    super.initState();
    context.read<LogicGatesLogic>().resetOutputs();
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
                                              title: AND_GATE,
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
                                              title: NAND_GATE,
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
                                              title: OR_GATE,
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
                                              title: NOR_GATE,
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
                                              title: XOR_GATE,
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
                                              title: XNOR_GATE,
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

class GateRow extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final bool? isReversed;
  final String? title;
  final String? image;
  const GateRow({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.isReversed,
    @required this.title,
    @required this.image,
  }) : super(key: key);

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
            gateType: title,
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
          gateType: title,
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

class GateContainer extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? image;
  final String? gateType;
  const GateContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.image,
    @required this.gateType,
  }) : super(key: key);

  @override
  State<GateContainer> createState() => _GateContainerState();
}

List<String> inputs = ['0', '0'];

void changeInputValue(int index, String value) {
  inputs[index] = value;
}

List<String> getInputValues() {
  return inputs;
}

class _GateContainerState extends State<GateContainer> {
  @override
  void initState() {
    super.initState();
    inputs = ['0', '0'];
  }

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
                  index: 0,
                  onPressChangeInputValue: changeInputValue,
                  getInputList: getInputValues,
                  gateType: widget.gateType!,
                ),
                SizedBox(
                  height: ((widget.screenHeight! * 0.131) -
                          (widget.screenWidth! * 0.085) * 2) /
                      3,
                ),
                GateButton(
                  screenHeight: widget.screenHeight!,
                  screenWidth: widget.screenWidth!,
                  index: 1,
                  onPressChangeInputValue: changeInputValue,
                  getInputList: getInputValues,
                  gateType: widget.gateType!,
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
                GateRessult(
                  screenHeight: widget.screenHeight!,
                  screenWidth: widget.screenWidth!,
                  gateType: widget.gateType!,
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

class GateButton extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final int? index;
  final Function(int index, String value)? onPressChangeInputValue;
  final Function()? getInputList;
  final String? gateType;
  const GateButton({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.index,
    @required this.onPressChangeInputValue,
    @required this.getInputList,
    @required this.gateType,
  }) : super(key: key);

  @override
  State<GateButton> createState() => _GateButtonState();
}

class _GateButtonState extends State<GateButton> {
  String text = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth! * 0.085,
      decoration: BoxDecoration(
        color: customColors.main,
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            text = context.read<LogicGatesLogic>().onPress(text);
            widget.onPressChangeInputValue!(widget.index!, text);
            context
                .read<LogicGatesLogic>()
                .countResult(widget.getInputList!(), widget.gateType!);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: widget.screenHeight! * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GateRessult extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? gateType;
  const GateRessult({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.gateType,
  }) : super(key: key);

  @override
  State<GateRessult> createState() => _GateRessultState();
}

class _GateRessultState extends State<GateRessult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth! * 0.085,
      decoration: BoxDecoration(
        color: customColors.containerResult,
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: TextButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.white,
        ),
        child: Text(
          context.watch<LogicGatesLogic>().getOutput(widget.gateType!),
          style: TextStyle(
            fontSize: widget.screenHeight! * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
