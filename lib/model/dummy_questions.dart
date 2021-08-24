import 'package:iq_test/model/questions.dart';

class QuizBrain {
  List<Question> easyQuestion = [
    Question('Which number should come next in the pattern?\n 37, 34, 31, 28',
        ['a. 25', 'b. 27', 'c. 32', 'd. 20'], 'a. 25'),
    Question(
        'Find the answer that best completes the analogy:\nBook is to Reading as Fork is to:',
        ['a. drawing', 'b. writing', 'c. stirring', 'd. eating'],
        'd. eating'),
    Question(
        'Find two words, one from each group, that are the closest in meaning:\nGroup A-talkative, job, ecstatic\nGroup B-angry, wind, loquacious',
        [
          'a. talkative and wind',
          'b. job and angry',
          'c. talkative and loquacious',
          'd. ecstatic and angry'
        ],
        'c. talkative and loquacious'),
    Question(
        'Which of the following can be arranged into a 5-letter English word?',
        ['a. H R G S T', 'b.  R I L S A', 'c. T O O M T', 'd. W Q R G S'],
        'b.  R I L S A'),
    Question('What number best completes the analogy:\n8:4 as 10:',
        ['a. 3', 'b. 7', 'c.24', 'd.5'], 'd.5'),
  ];

  List<Question> mediamQuestion = [
    Question(
        'Which answer expresses the meaning of the specified word best?',
        [
          'a. compassionate',
          'b. comforting',
          'c. explanatory',
          'd. meddlesome'
        ],
        'b. comforting'),
    Question(
        'Which number logically follows this series?\n4     6     9     6     14     6      ...',
        ['a. 6', 'b. 17', 'c. 19', 'c. 21'],
        'c. 19'),
    Question(
        'Which conclusion follows from the statements with absolute certainty?\n1None of the stamp collectors is an architect.\n2-All the drones are stamp collectors.',
        [
          'a. all stamp collectors are architects',
          'b. architects are not drones',
          'c. no stamp collectors are drones',
          'd. some drones are architects'
        ],
        'a. all stamp collectors are architects'),
    Question(
        'What is the correct answer to the following problem.\nTom has a new set of golf clubs.\n Using a club 8, the ball travels an average distance of 100 meters.\n Using a club 7, the ball travels an average distance of 108 meters. Using a club 6, the ball travels an average distance of 114 meters. How far will the ball go if Tom uses a club 5?',
        ['a. 122 meters', 'b.  120 meters', 'c. 118 meters', 'd.116 meters'],
        'c. 118 meters'),
    Question(
        'Which answer expresses the meaning opposite of that of the specified word best?\n7. tough',
        ['a. cowardly', 'b. starch', 'c.strong', 'd.tender'],
        'd.tender'),
    Question(
        'Which word(s) can logically replace the question mark?\n8. Water is to a pipe as ? is to a wire.',
        ['a. cord', 'b. electricity', 'c.heat', 'd.gas'],
        'b. electricity'),
    Question(
        'Which of the meanings is the best fitting for the specified word?\n9. displeasure',
        ['a. injustice', 'b. complaint', 'c.futile', 'd.sin'],
        'b. complaint'),
  ];
}
