import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iq_test/model/dummy_questions.dart';
import 'package:iq_test/screens/result_score_for_easy_mode.dart';
import 'package:iq_test/screens/result_score_for_mediam_mode.dart';

class MediamQuestionScreen extends StatefulWidget {
  const MediamQuestionScreen({Key? key}) : super(key: key);

  @override
  _MediamQuestionScreenState createState() => _MediamQuestionScreenState();
}

class _MediamQuestionScreenState extends State<MediamQuestionScreen> {
  final quizBrain = QuizBrain();
  int _questionNumber = 0;
  Color colorToShow = Colors.indigoAccent;
  Color colorToShowRightAnswer = Colors.green;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int score = 0;
  int timer = 30;
  String showTimer = '30';
  bool cancelTimer = false;

  Map<String, Color> btnColor = {
    '0': Colors.indigoAccent,
    '1': Colors.indigoAccent,
    '2': Colors.indigoAccent,
    '3': Colors.indigoAccent,
  };

  void checkAnswer(int index) {
    if (getQuestionAnswer()[index] == getRightAnswer()) {
      score += 1;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    setState(() {
      btnColor['$index'] = colorToShow;
      for (int i = 0; i < getQuestionAnswer().length; i++) {
        if (getQuestionAnswer()[i] == getRightAnswer()) {
          btnColor['$i'] = colorToShowRightAnswer;
        }
      }
      cancelTimer = true;
    });
    Timer(Duration(milliseconds: 1000), nextQuestion);
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    if (_questionNumber < quizBrain.mediamQuestion.length - 1) {
      Timer.periodic(oneSecond, (t) {
        setState(() {
          if (timer < 1) {
            t.cancel();
            nextQuestion();
          } else if (cancelTimer) {
            t.cancel();
          } else {
            timer = timer - 1;
          }
          showTimer = timer.toString();
        });
        if (!mounted) {
          t.cancel();
          return;
        }
      });
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Easy Mode',
                ),
                actions: [],
              ),
              body: Column(
                children: [
                  Text(
                    getQuestionNumber(),
                    style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        answerList(0),
                        answerList(1),
                        answerList(2),
                        answerList(3),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        showTimer,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      onWillPop: _showMaterialDialog,
    );
  }

  Future<bool> _showMaterialDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Quizstar'),
            content: Text('You can\'t Go back At This stage'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  Widget answerList(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        color: btnColor['$index'],
        onPressed: () => checkAnswer(index),
        child: Text(
          getQuestionAnswer()[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            height: 2.5,
          ),
        ),
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 35.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  void nextQuestion() {
    startTimer();
    cancelTimer = false;
    timer = 30;
    if (_questionNumber < quizBrain.mediamQuestion.length - 1) {
      setState(() {
        _questionNumber++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultScoreForMediamMode(
            score: score,
          ),
        ),
      );
      return;
    }
    btnColor['0'] = Colors.indigoAccent;
    btnColor['1'] = Colors.indigoAccent;
    btnColor['2'] = Colors.indigoAccent;
    btnColor['3'] = Colors.indigoAccent;
  }

  String getQuestionNumber() {
    return quizBrain.mediamQuestion[_questionNumber].questionText;
  }

  List<String> getQuestionAnswer() {
    return quizBrain.mediamQuestion[_questionNumber].questionAnswer;
  }

  String getRightAnswer() {
    return quizBrain.mediamQuestion[_questionNumber].rightAnswer;
  }
}
