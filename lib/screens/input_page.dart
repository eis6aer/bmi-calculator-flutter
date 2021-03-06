import 'package:bmi_calculator/common/Constants.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/calculate_usecase.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bmi_card.dart';
import '../common/Constants.dart';
import '../components/SimpleCardDetail.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  double height = 180;
  int weight = 90;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BMICard(
                      action: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      color: selectedGender == Gender.MALE ? kDefaultCardColor : kInactiveCardColor,
                      cardChild: SimpleCardDetail(
                        icon: FontAwesomeIcons.mars,
                        description: 'MALE'
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      action: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      color: selectedGender == Gender.FEMALE ? kDefaultCardColor : kInactiveCardColor,
                      cardChild: SimpleCardDetail(
                          icon: FontAwesomeIcons.venus,
                          description: 'FEMALE'
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BMICard(
                color: kDefaultCardColor,
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
                          height.toString(),
                          style: kDataStyle
                        ),
                        Text(
                          'cm',
                          style: kSubDataStyle
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: kPinkColor.withAlpha(0x1f),
                        inactiveTrackColor: kGreyColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0
                        ),
                        thumbColor: kPinkColor
                      ),
                      child: Slider(
                          min: 120.0,
                          max: 220.0,
                          value: height,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue.round().toDouble();
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
                    child: BMICard(
                      color: kDefaultCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kDataStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      color: kDefaultCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kDataStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
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
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                onPressed: () {
                  CalculateBMI usecase = CalculateBMI();
                  double bmi = usecase.invoke(height, weight.toDouble());

                  Navigator.pushNamed(
                    context,
                    resultsRoute,
                    arguments: ResultsArguments(
                      bmi,
                      usecase.getResult(bmi),
                      usecase.getInterpretation(bmi)
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
              width: double.infinity,
              height: kBottomContainerHeight
            )
          ],
        )
    );
  }
}
