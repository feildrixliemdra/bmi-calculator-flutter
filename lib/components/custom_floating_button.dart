import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  CustomFloatingButton({this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 30.0,
      fillColor: kFontColor,
      child: Icon(iconData),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      onPressed: onPressed,
    );
  }
}
