import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(
    MyApp()); //sintaxe para qualquer função que tenha apenas uma linha dentro!

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'Qual a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 5},
        {'text': 'Roxo', 'score': 8},
        {'text': 'Vermelho', 'score': 6},
      ],
    },
    {
      'questionText': 'Qual o seu animal favorito?',
      'answers': [
        {'text': 'Leão', 'score': 5},
        {'text': 'Coruja', 'score': 8},
        {'text': 'Guaxinim', 'score': 6},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Teste Flutter'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

/*
Como fazer funções anônimas

RaisedButton(
  child: Text('Resposta 2'),
  onPressed: () => print('Resposta 2 escolhida!'), //
  ),

RaisedButton(
  child: Text('Resposta 3'),
  onPressed: () {
    //código
    print(
     'Resposta 3 escolhida!');
   },
  ),
*/
