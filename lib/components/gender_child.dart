import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GenderChild extends StatelessWidget {
  final IconData iconData;
  final String genderText;

  GenderChild({this.iconData, this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText, style: kLabelTextStyle)
      ],
    );
  }
}
