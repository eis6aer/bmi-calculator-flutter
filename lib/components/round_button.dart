import 'package:flutter/material.dart';

class RoundMaterialButton extends StatelessWidget {
  RoundMaterialButton({this.child, this.onPressed});

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      disabledElevation: 6.0,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: child,
    );
  }
}
