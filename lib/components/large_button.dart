import 'package:flutter/material.dart';
import '../common/Constants.dart';

class LargeButton extends StatelessWidget {
  LargeButton({@required this.title, this.onPressed});

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          child: FlatButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                title,
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
          width: double.infinity,
          height: kBottomContainerHeight
      ),
    );
  }
}