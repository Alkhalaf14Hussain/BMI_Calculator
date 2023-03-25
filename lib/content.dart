import 'package:flutter/material.dart';
class content extends StatelessWidget {
  content({required this.icon,required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80,),
        SizedBox(height: 15,),
        Text(text,style: TextStyle(fontSize: 18),)

      ],
    );
  }
}
