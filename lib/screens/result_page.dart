import 'package:bmi_calculator/components/card_container.dart';
import 'package:bmi_calculator/logic/calculation.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/calculate_button.dart';

class ResultPage extends StatelessWidget {
//  final String result;
//  final String resultDetail;
//  final String bmi;
//
//  ResultPage(
//      {@required this.result, @required this.resultDetail, @required this.bmi});

  String result;
  String resultDetail;
  String bmi;
  @override
  Widget build(BuildContext context) {
    final Calculation args = ModalRoute.of(context).settings.arguments;
    bmi = args.calculateBMI();
    result = args.getResult();
    resultDetail = args.getResultDetail();

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardContainer(
                bgColor: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      result.toUpperCase(),
                      style: kResultLabelStyle,
                    ),
                    Text(
                      bmi,
                      style: kResultNumberStyle,
                    ),
                    Text(
                      resultDetail,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
