import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({this.iconText, this.iconImage});
  final String iconText;
  final IconData iconImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
          iconImage,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(iconText,style: TextStyle(color: Colors.white,fontSize: 18.0),)
      ],
    );
  }
}