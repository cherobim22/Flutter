// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './question.dart';
import './answear.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function() toRespond;

  Quiz({ 
    required this.questions,
    required this.questionSelected,
    required this.toRespond
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }
  


  @override
  Widget build(BuildContext context) {

    List<String> res = hasQuestionSelected  ? questions[questionSelected].cast()['resp'] : [];
    return Column(
          children: <Widget>[
            Question(questions[questionSelected]['text'].toString()),
            ...res.map((text) => Answear(text, toRespond)).toList() // todos os elementos na lista
          ],
        );
  }
}