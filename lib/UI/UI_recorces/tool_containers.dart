import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
