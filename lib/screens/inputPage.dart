import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../conponents/genderCardLayout.dart';
import '../conponents/makeCardLayout.dart';
import '../constants.dart';
import 'resultPage.dart';
import '../conponents/roudIconButton.dart';
import '../conponents/bottomButton.dart';
import '../BrainBmiCalculator.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleButtonColor = kInactiveColor;
  Color femaleButtonColor = kInactiveColor;

  Gender selectedGender;
  int age =25;
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              "BMI Calculator"
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
           child : Row(
              children: [
                Expanded(
                  child: makeCardLayout(
                    colour : selectedGender == Gender.male ? kActiveColor : kInactiveColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: genderCardLayout(
                        name: "MALE",
                        icon: FontAwesomeIcons.mars
                    ),
                  ),
                ),

                Expanded(
                  child: makeCardLayout(
                    colour : selectedGender == Gender.female ? kActiveColor : kInactiveColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: genderCardLayout(
                        name: "FEMALE",
                        icon: FontAwesomeIcons.venus

                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: makeCardLayout(
                colour : Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kDigitTextStyle,
                        ),

                        Text(
                          "cm",
                          style: kLableTextStyle,
                        )
                      ],
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeightValue.toDouble(),
                        max: kMaxHeightValue.toDouble(),
                        onChanged: (double newHeight){
                          setState(() {
                            height = newHeight.toInt();
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
              children: [
                Expanded(
                    child: makeCardLayout(
                        colour : Color(0xFF1D1E33),
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: kLableTextStyle,
                            ),

                            Text(
                              weight.toString(),
                              style: kDigitTextStyle,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                ),
                Expanded(
                    child: makeCardLayout(
                        colour : Color(0xFF1D1E33),
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "AGE",
                              style: kLableTextStyle,
                            ),

                            Text(
                              age.toString(),
                              style: kDigitTextStyle,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(
                                          () {
                                        age--;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),

                              ],
                            )

                          ],
                        ),
                    ),
                ),
              ],
            ),
          ),
          BottomButton(name: "CALCULATE",onTap: (){
            CalculatorBrain calc =
            CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                  resultColor: calc.getColorResult(),
                ),
              )
              );
            },
          )
        ],
      ),
    );
  }
}
