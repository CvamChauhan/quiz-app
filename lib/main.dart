import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionBank.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "QUIZZLER",
              style: TextStyle(letterSpacing: 4),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.grey.shade800,
          body: Quizz(),
        ),
      ),
    ),
  );
}

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

List<Icon> scoreKeeper = [];
void checkAns(bool picked, BuildContext context) {
  if (quesNo == qBank.length - 1) {
    Alert(
            context: context,
            title: "Finished",
            desc: 'You\'ve reached the end of the quiz.')
        .show();
    quesNo = 0;
    scoreKeeper = [];
  } else {
    if (picked == qBank[quesNo].qAns)
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    else
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    nextQuestion();
  }
}

class _QuizzState extends State<Quizz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.black,
          height: 300,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Center(
              child: Text(
                qBank[quesNo].qText,
                style: TextStyle(
                    color: Colors.white, fontSize: 22, wordSpacing: 2),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
            onPressed: () {
              setState(() {
                checkAns(true, context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("True",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
            onPressed: () {
              setState(() {
                checkAns(false, context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("False",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
        ),
        Container(
          color: Colors.black,
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
