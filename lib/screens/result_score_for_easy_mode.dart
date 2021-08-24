import 'package:flutter/material.dart';
import 'package:iq_test/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScoreForEasyMode extends StatefulWidget {
  final int score;
  const ResultScoreForEasyMode({Key? key, required this.score})
      : super(key: key);

  @override
  _ResultScoreForEasyModeState createState() => _ResultScoreForEasyModeState();
}

class _ResultScoreForEasyModeState extends State<ResultScoreForEasyMode> {
  int oldScore = 0;
  @override
  void initState() {
    super.initState();
    setScore();
  }

  void setScore() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('easyScore')) {
      oldScore = prefs.getInt('easyScore')!;
    }

    if (oldScore > widget.score) {
      return;
    }
    prefs.setInt('easyScore', widget.score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Result',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Material(
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage('assets/images/good.png'),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Congratulation Your score ${widget.score} marks',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text('Continue'),
                        style: TextButton.styleFrom(
                          side: BorderSide(
                              width: 3.0, color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
