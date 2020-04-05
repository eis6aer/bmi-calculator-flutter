import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {

  final Color color;
  final Widget cardChild;

  BMICard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}