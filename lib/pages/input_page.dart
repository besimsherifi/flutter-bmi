import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bottom_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE')),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                      selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE')),
                ))
              ],
            )),
            Expanded(
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              activeTrackColor: Color(0xFFEB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x15EB1555)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                print(newValue);
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        )
                      ])),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          kActiveCardColor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kBmiLabels,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Color(0xFF4C4F5e),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Color(0xFF4C4F5e),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))),
                  Expanded(
                      child: ReusableCard(
                          kActiveCardColor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kBmiLabels,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Color(0xFF4C4F5e),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Color(0xFF4C4F5e),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              ),
            ),
            BottomButton('CALCULATE', () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(calc.calculateBMI(), calc.getResult(), calc.getInterpretation());
              }));
            })
          ],
        ));
  }
}


