import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
class ResultPage extends StatelessWidget {
  ResultPage({ @required this.bmiresult, @required this.bmitext, @required this.interpretation});
  final String bmiresult;
  final String bmitext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULT"),
        backgroundColor: Color.fromARGB(255, 29, 35, 43),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(child: Text("BMI",style: kTitleTextStyle,)),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivateColour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("You are $bmitext",style: kResultTextStyle,),
                  Text(bmiresult,style: kBMITextStyle,),
                  Text(interpretation, style: kResultTextStyle,),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: "RE-CALCULATE", onTap: (){
            Navigator.pop(context);
          },)
        ],
      )
    );
  }
}