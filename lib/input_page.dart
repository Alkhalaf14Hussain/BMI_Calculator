import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'content.dart';
import 'constants.dart';
import 'calcultaion.dart';
enum Gender  {
male,
female
}



class InputPage extends StatefulWidget {
  @override

  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender ?gender;
   int height=120;
   int age=15;
   int weight=40;
   double bmi=0;

   String BMI (){
     bmi= weight/pow(height/100, 2);
     return bmi.toStringAsFixed(1);
   }

   String status (){
     if (bmi>25)
       return 'overweight';
     else if (bmi>18)
       return 'normal';
     else
       return 'معصقل';
   }
   String advice (){
     if (bmi>25)
       return 'too fat, you have to lose some weight';
     else if (bmi>18)
       return  'very good, keep going';
     else
       return 'you are too skiny you have to eat more';
   }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child:

            Row(
              children: [
                Expanded(child: Reuseable(
                  onPress: (){
                    setState(() {
                      gender=Gender.male;
                    });
                  },
                  colour: (gender==Gender.male)?activeColor:inActiveColor,
                  cardChild: content(
                    icon:
                    FontAwesomeIcons.mars, text: 'MALE',

                  ),
                ),
                ),
                Expanded(child: Reuseable(
                  onPress:(){
                setState(() {
                gender=Gender.female;
                });
                },

                  colour: (gender==Gender.female)? activeColor:inActiveColor,
                  cardChild: content(
                    icon:
                    FontAwesomeIcons.venus, text: 'FEMALE',

                  ),
                ))
                ],
              )
            ),
            Expanded(child: Reuseable(
              colour: inActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                  style: TextStyle(
                    fontSize: 18
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text(height.toString(),style: kNumberTextStyle,),
                    Text('cm')
                  ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.white,
                      thumbColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30
                      )
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.teal,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double value) {
                        setState(() {
                          height=value.round();
                        });
                      },

                    ),
                  )

                ],
              ),
              ),
              ),
            Expanded(child:
            Row(
              children: [
                Expanded(child: Reuseable(
                  colour: inActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",
                      style: TextStyle(fontSize: 18),),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                              setState(() {
                                age=age+1;
                              });
                              },
                              child: Icon(FontAwesomeIcons.plus,color: Colors.white,)),
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: (){
                                setState(() {
                                  age=age-1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,color: Colors.white))

                        ],
                      )
                    ],
                  ),

    ),
    ),
                Expanded(child: Reuseable(
                  colour: inActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",
                        style: TextStyle(fontSize: 18),),
                      Text(weight.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight=weight+1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus,color: Colors.white,)),
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: (){
                                setState(() {
                                  weight=weight-1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,color: Colors.white))

                        ],
                      )
                    ],
                  ),
    )
    )],
            )
            ),
         Container(
           color :Colors.teal,
           margin: EdgeInsets.only(top: 10),
           width: double.infinity,
           height: 80,

           child: GestureDetector(

             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("CALCULATE",style: TextStyle(fontSize: 50),),
               ],
             ),
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:(context){
               return Calculation(BMI(),advice(),status()); }));
             },
           ),
         )
          ],
        )
      ),
    );
  }
}
class Reuseable extends StatelessWidget {
   const Reuseable(
      {Key? key,
        this.colour = const Color(0xff1D1F33),
        this.cardChild,
        this.onPress})

      : super(key: key);
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius:BorderRadiusDirectional.circular(10),
            color:colour,
          )
      ),
    );
  }
}


