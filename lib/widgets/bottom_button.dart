import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.title, this.onTap);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: kCalculateButtonStyle,
        )),
        color: kBottomButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}