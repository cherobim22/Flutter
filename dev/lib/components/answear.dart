// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Answear extends StatelessWidget {

 String text;
 final void Function() onPress;

 Answear(this.text, this.onPress);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: onPress,
        child: Text(text)
      ),
    );
  }
}
