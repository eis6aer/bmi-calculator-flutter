import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function action;

  BMICard({@required this.color, this.cardChild, this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}