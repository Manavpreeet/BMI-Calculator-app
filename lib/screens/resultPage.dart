import 'package:bmi_calculator_app/conponents/bottomButton.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/conponents/makeCardLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatelessWidget {


  ResultPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText,
        @required this.resultColor});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color resultColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: kDigitTextStyle,
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: makeCardLayout(
                colour: kActiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    textStyle(name: resultText.toUpperCase(), colour: resultColor,),
                    Text(
                      bmiResult,
                      style: kDigitTextStyle,
                    ),
                    detailTextStyle(name: interpretation),
                  ],
                ),
              ),
            ),
            BottomButton(name: "RE-CALCULATE",onTap: () {
              Navigator.pop(context);
            },)
          ],
        ),
      ),
    );
  }

}

class textStyle extends StatelessWidget {

  String name;
  Color colour;

  textStyle({this.name, this.colour});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: colour,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class detailTextStyle extends StatelessWidget {

  String name;

  detailTextStyle({this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
      ),
    );
  }
}
