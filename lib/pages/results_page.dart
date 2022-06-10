// ignore_for_file: implementation_imports

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage(this.bmiResult, this.resultText, this.interpretation);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your result',
                  style: kYourResultText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(kActiveCardColor, Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText,style: kBmiResultText),
                Text(bmiResult,style: kBMIResult),
                Text(interpretation,textAlign: TextAlign.center ,style: KBMIResultDescription),
              ],
            )),
          ),Expanded(child: BottomButton('RECALCULATE', (){
            Navigator.pop(context);
          }))
        ],
      ),
    );
  }
}
