import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/screens/calculate_usecase.dart';
import 'package:flutter/material.dart';
import '../common/Constants.dart';
import '../components/large_button.dart';

class ResultsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ResultsArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Results")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your results',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600
                ),
              )
            )
          ),
          Expanded(
            flex: 5,
            child: BMICard(
              color: kDefaultCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    args.result,
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    args.bmi.toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  Text(
                    args.interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
          LargeButton(
            title: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class ResultsArguments {
  final String result;
  final String interpretation;
  final double bmi;

  ResultsArguments(this.bmi, this.result, this.interpretation);
}

