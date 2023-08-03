import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;
  String calculate(){
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi < 16){
      return "Severe Thinness";
    }
    else if(_bmi >=16 && _bmi < 17){
      return "Moderate Thinness";
    }
    else if(_bmi >=17 && _bmi < 18.5){
      return "Mild Thinness";
    }
    else if(_bmi >=18.5 && _bmi < 25){
      return "Normal";
    }
    else if(_bmi >=25 && _bmi < 30){
      return "Overweight";
    }
    else if(_bmi < 35 && _bmi >=30){
      return "Obese Class I";
    }
    else if(_bmi >=35 && _bmi < 40){
      return "Obese Class II";
    }
    else{
      return "Obese Class III";
    }
  }
  String getInterpretation(){
    if(_bmi < 18.5){
      return "Focus on a balanced diet and do regular exercises";
    }
    else if(_bmi>=18.5 && _bmi < 25){
      return "Good, keep up the good diet!";
    }
    else if(_bmi>=25 && _bmi < 30){
      return "Reduce intake of sugary and processed foods";
    }
    else if(_bmi>=30 && _bmi < 35){ 
      return "Do moderate exercises under a certified trainer";
    }
    else if(_bmi>=35 && _bmi < 40){
      return "Adopt a structured weight loss program from a healthcare professional";
    }
    else{
      return "May require weight loss surgery under healthcare professionals.";
    }
  }
} 