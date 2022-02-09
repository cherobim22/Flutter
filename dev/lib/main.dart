import 'package:flutter/material.dart';
import 'components/question.dart';
import 'components/answear.dart';

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

  void _responder (){
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

    List<String> res = hasQuestionSelected ? _perguntas[_selectedQuestion].cast()['resp'] : [];
    List<Widget> widgets = res.map((text) => Answear(text, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: hasQuestionSelected ? Column(
          children: <Widget>[
            Question(_perguntas[_selectedQuestion]['text'].toString()),
            ...widgets // todos os elementos na lista

          ],
        ) : const Center(
          child: Text(
            'Parabens!',
            style: TextStyle(
              fontSize: 28
            ),

            ),
        ),
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