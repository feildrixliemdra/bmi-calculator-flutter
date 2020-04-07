import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CardContainer extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;
  final Function onPress;
  CardContainer({this.bgColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kCardMarginAll),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(kCardBorderRad),
        ),
      ),
    );
  }
}
