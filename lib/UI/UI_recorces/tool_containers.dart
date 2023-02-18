import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

import '../../main_menu.dart';

class TollContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const TollContainer(
      {Key? key, @required this.height, @required this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: customColors.main,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: customColors.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
        ),
        child: child,
      ),
    );
  }
}

class TollContainerTitleBar extends StatelessWidget {
  const TollContainerTitleBar(
      {@required this.title,
      @required this.screenHeight,
      @required this.screenWidth,
      super.key});
  final String? title;
  final double? screenHeight;
  final double? screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! * 0.045,
      decoration: BoxDecoration(
        color: customColors.main,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.03),
          child: AutoSizeText(
            title!,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class DropdownContainer extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? label;
  final String? value;
  final List<String>? units;
  final Color? color;
  final bool? enabled;

  final Function(String value)? setInputValue;
  final Function(String value)? setDropdownValue;
  final Function()? getResult;

  const DropdownContainer({
    Key? key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.label,
    @required this.value,
    @required this.units,
    this.color,
    this.enabled = true,
    this.setInputValue,
    this.setDropdownValue,
    @required this.getResult,
  }) : super(key: key);
  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  String? dropdownvalue;

  @override
  void initState() {
    dropdownvalue = widget.value;
    super.initState();
  }

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
                    height: widget.screenHeight! * 0.031,
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
                    height: widget.screenHeight! * 0.035,
                    child: TextField(
                      onChanged: widget.setInputValue != null
                          ? (String value) {
                              widget.setInputValue!(value);
                            }
                          : (String value) {},
                      enabled: widget.enabled,
                      maxLines: 1,
                      cursorColor: Colors.white,
                      cursorWidth: 1.5,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,25}'))
                      ],
                      style: TextStyle(
                        color: widget.color ?? Colors.white,
                        fontSize: widget.screenWidth! * 0.0375,
                      ),
                      decoration: InputDecoration(
                        hintText: widget.getResult!(),
                        hintStyle: TextStyle(
                          color: widget.color ?? Colors.grey,
                          fontSize: widget.screenWidth! * 0.0375,
                          fontWeight: widget.enabled == true
                              ? FontWeight.normal
                              : FontWeight.bold,
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
                            value: dropdownvalue,
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
                                  dropdownvalue = newValue!;
                                  widget.setDropdownValue!(newValue);
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
