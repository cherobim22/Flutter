// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {

 String text;
 
 Result(this.text);

  @override
  Widget build(BuildContext context){
    return  Center(
      child: Text(
          text,
          style: const TextStyle(
          fontSize: 28
          ),
        ),
      );
  }
}
