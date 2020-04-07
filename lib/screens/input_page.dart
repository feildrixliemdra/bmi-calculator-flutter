import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/card_container.dart';
import 'package:bmi_calculator/components/custom_floating_button.dart';
import 'package:bmi_calculator/components/gender_child.dart';
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/logic/calculation.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = kMinUserHeight;
  int userWeight = 50;
  int userAge = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      bgColor: selectedGender == Gender.male
                          ? kCardColor
                          : kInActiveColor,
                      cardChild: GenderChild(
                        iconData: FontAwesomeIcons.mars,
                        genderText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                      child: CardContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: GenderChild(
                      iconData: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                    bgColor: selectedGender == Gender.female
                        ? kCardColor
                        : kInActiveColor,
                  ))
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                bgColor: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '$userHeight',
                          style: kWeightLabelStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13.0),
                          thumbColor: kSubmitContainerColor,
                          overlayColor: kSliderOverlayColor,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0)),
                      child: Slider(
                        value: userHeight.toDouble(),
                        min: kMinUserHeight.toDouble(),
                        max: kMaxUserHeight.toDouble(),
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            userHeight = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardContainer(
                      bgColor: kCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userWeight.toString(),
                            style: kWeightLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomFloatingButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                },
                              ),
                              CustomFloatingButton(
                                onPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      bgColor: kCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userAge.toString(),
                            style: kWeightLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomFloatingButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    userAge--;
                                  });
                                },
                              ),
                              CustomFloatingButton(
                                onPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                Navigator.pushNamed(context, '/result',
                    arguments:
                        Calculation(height: userHeight, weight: userWeight));
              },
            )
          ],
        ));
  }
}
