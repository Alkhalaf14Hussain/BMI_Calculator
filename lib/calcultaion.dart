import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';
import 'constants.dart';

class Calculation extends StatelessWidget {
  Calculation(this.bmi, this.advice, this.result);
  final String bmi;
  final String advice;
  final String result;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(flex: 1,
            child: Center(
              child: Text("Your BMI is: ",
                style:TextStyle(fontSize: 50,color: Colors.white),

              ),
            ),
          ),
          Expanded(flex: 2, child: Container(
            color: activeColor,
            child: Center(
              child: Text(result,
                style:TextStyle(fontSize: 50,color: Colors.white),

              ),
            ),
          ),
          ),
          Expanded(flex: 2, child: Container(
            color: activeColor,
            child: Center(
              child: Text(bmi,
                style:TextStyle(fontSize: 50,color: Colors.white),

              ),
            ),
          ),
          ),
          Expanded(flex: 2, child: Center(
            child: Container(
              color: activeColor,
              child: Center(
                child: Text(advice,textAlign:TextAlign.center,
                  style:TextStyle(fontSize: 50,color: Colors.white,),

                ),
              ),
            ),
          ),
          ),
          GestureDetector(
            child: Center(child: Container(color: Colors.teal,
                width: 500,
                child: Center(child: Text("RE-CALCULATE",style: TextStyle(fontSize: 50),)))),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

