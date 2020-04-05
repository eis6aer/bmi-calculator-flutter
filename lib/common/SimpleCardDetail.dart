import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';


class SimpleCardDetail extends StatelessWidget {
  SimpleCardDetail({@required this.icon, @required this.description});

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(icon, size: 80.0,),
        SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: labelTextStyle,
        )
      ],
    );
  }
}