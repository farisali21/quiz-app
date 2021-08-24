import 'package:flutter/material.dart';
import 'package:iq_test/screens/easy_mode_screen.dart';
import 'package:iq_test/screens/heightest_score_screen.dart';
import 'package:iq_test/screens/mediam_mode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightestScoreForEasyMode = 0;
  int heightestScoreForMediamMode = 0;
  int? checkScore;
  @override
  void initState() {
    super.initState();
    getHeightestScoreForEasyMode();
    getHeightestScoreForMediamMode();
  }

  void getHeightestScoreForEasyMode() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('easyScore')) {
      heightestScoreForEasyMode = prefs.getInt('easyScore')!;
    }
  }

  void getHeightestScoreForMediamMode() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('mediamScore')) {
      heightestScoreForMediamMode = prefs.getInt('mediamScore')!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Models',
          style: TextStyle(
              color: Colors.white70, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black12)),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HeightestScorePage(
                          heightestScoreForEasyMode: heightestScoreForEasyMode,
                          heightestScoreForMedaimMode:
                              heightestScoreForMediamMode,
                        )));
              },
              icon: Icon(
                Icons.credit_score,
                color: Colors.yellowAccent,
              ),
              label: Text('')),
        ],
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage('assets/images/good.png'),
            ),
            Text(
              'Let\'s Test Your Brain Brooo',
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                primary: Colors.amberAccent,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => EasyQuestionScreen(),
                  ),
                );
              },
              child: Text(
                'Easy Mode',
                style: TextStyle(
                  backgroundColor: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                primary: Colors.amberAccent,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MediamQuestionScreen(),
                  ),
                );
              },
              child: Text(
                'Mediam Mode',
                style: TextStyle(
                  backgroundColor: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
