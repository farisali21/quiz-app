import 'package:flutter/material.dart';
import 'package:iq_test/screens/home_screen.dart';

class HeightestScorePage extends StatefulWidget {
  final int? heightestScoreForEasyMode;
  final int? heightestScoreForMedaimMode;
  const HeightestScorePage(
      {Key? key,
      required this.heightestScoreForEasyMode,
      required this.heightestScoreForMedaimMode})
      : super(key: key);

  @override
  _HeightestScorePageState createState() => _HeightestScorePageState();
}

class _HeightestScorePageState extends State<HeightestScorePage> {
  @override
  void initState() {
    super.initState();
    print(widget.heightestScoreForEasyMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.heightestScoreForEasyMode! > 0
                              ? Column(
                                  children: [
                                    Text(
                                      'Dude Your heightest score is ${widget.heightestScoreForEasyMode} marks',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    widget.heightestScoreForEasyMode! > 2
                                        ? Text(
                                            'Yor Are so Smart Congratulation \nknow u can be a developer ',
                                            style: TextStyle(
                                                color: Colors.purpleAccent,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Text(
                                            'You Are so stupid fuck off....',
                                            style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                  ],
                                )
                              : Text(
                                  'you never do EasyMode test befor jsut try it first'),
                          SizedBox(
                            height: 20,
                          ),
                          widget.heightestScoreForMedaimMode! > 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Dude Your heightest score in medaim mode is ${widget.heightestScoreForMedaimMode} marks',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    widget.heightestScoreForEasyMode! > 2
                                        ? Text(
                                            'Yor Are so Smart Congratulation \nknow u can be a developer ',
                                            style: TextStyle(
                                                color: Colors.purpleAccent,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Text(
                                            'You Are so stupid fuck off....',
                                            style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                  ],
                                )
                              : Text(
                                  'you never do MediamMode test before just try it first'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
