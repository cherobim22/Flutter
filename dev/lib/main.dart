import 'package:dev/components/result.dart';
import 'package:flutter/material.dart';
import 'components/quiz.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _selectedQuestion = 0;  

  final  _perguntas = const [
      {
        'text': "Qual sua cor favorita?",
        'resp': ["azul", "vermelho", "preto"]
      },
      {
        'text': "Qual a sua profissão?",
        'resp': ["programador", "motoboy", "uber"]
      },
      {
        'text': "Qual seu hobbie?",
        'resp': ["leitura", "dormir", "comer"]
      }
    ];

  void _respond (){
   if(hasQuestionSelected){
      setState(() {
      _selectedQuestion++;
    });
   }
  }

  bool get hasQuestionSelected {
    return _selectedQuestion < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: hasQuestionSelected 
          ? Quiz(questions: _perguntas, questionSelected: _selectedQuestion, toRespond: _respond)
          : Result("Parabens Joven! 33")
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}  