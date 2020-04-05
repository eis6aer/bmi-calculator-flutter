import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BMICard.dart';
import 'common/SimpleCardDetail.dart';

const bottomContainerHeight = 60.0;
const defaultCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor =  Color(0xFFEB1555);
enum Gender {MALE, FEMALE}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      child: BMICard(
                        color: selectedGender == Gender.MALE ? defaultCardColor : inactiveCardColor,
                        cardChild: SimpleCardDetail(
                          icon: FontAwesomeIcons.mars,
                          description: 'MALE'
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      child: BMICard(
                        color: selectedGender == Gender.FEMALE ? defaultCardColor : inactiveCardColor,
                        cardChild: SimpleCardDetail(
                            icon: FontAwesomeIcons.venus,
                            description: 'FEMALE'
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BMICard(color: defaultCardColor,),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BMICard(
                      color: defaultCardColor,
                    ),
                  ),
                  Expanded(
                    child: BMICard(color: defaultCardColor,),
                  )
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight
            )
          ],
        )
    );
  }
}