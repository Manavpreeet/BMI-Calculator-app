import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/material.dart';

class genderCardLayout extends StatelessWidget {

  genderCardLayout({this.name, this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: kBottomCardSize,
          ),

          SizedBox(
            height: 15.0,
          ),

          Text(
            name,
            style: kLableTextStyle,
          ),
        ],
      ),
    );
  }

}