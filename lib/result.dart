import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    String phrase = 'Quiz encerrado!\n\n';
    String result = 'Sua pontuação final foi:\n';
    String points = resultScore.toString();
    return phrase + result + points;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            onPressed: reset,
            child: Text(
              '\nReiniciar Quiz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
