import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';
import 'bottom_button.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  int height=180;
  int weight=60;
  int age=20;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BODY MASS INDEX'),
        backgroundColor: Color.fromARGB(255, 29, 35, 43),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour: selectedGender==Gender.male?kActivateColour:kTappedColour,
                    cardchild: IconContent(iconText:"MALE", iconImage: FontAwesomeIcons.mars,),  
                  ),
                ),
                SizedBox(width: 5.0,),
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female?kActivateColour:kTappedColour,
                    cardchild: IconContent(iconText:"FEMALE", iconImage: FontAwesomeIcons.venus,),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActivateColour,
              cardchild: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Text("HEIGHT",style: kLabelTextStyle),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),),
                        Text('cm',style: kLabelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.yellow,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 17.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color.fromARGB(255, 20, 203, 212),
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kActivateColour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",style: kLabelTextStyle,),
                        Text(weight.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: Icon(Icons.add,color: Colors.white,),
                              backgroundColor: kBottomContainerColor ,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 18,),
                            FloatingActionButton(
                              child: Icon(Icons.remove,color: Colors.white,),
                              backgroundColor: kBottomContainerColor ,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.0,),
                Expanded(
                  child: ReusableCard(colour: kActivateColour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",style: kLabelTextStyle,),
                        Text(age.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: Icon(Icons.add,color: Colors.white,),
                              backgroundColor: kBottomContainerColor ,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 18,),
                            FloatingActionButton(
                              child: Icon(Icons.remove,color: Colors.white,),
                              backgroundColor: kBottomContainerColor ,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmiresult: calc.calculate(), bmitext: calc.getResult(), interpretation: calc.getInterpretation(),),));
            },
          ),
        ],
      ),
    );
  }
}

