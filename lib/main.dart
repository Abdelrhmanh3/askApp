import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Brain brain = Brain();
void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 217, 217),
        appBar: AppBar(
          title: const Text('Information Test'),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightanswers = 0;
  void checkanswers(bool whatuserpicked) {
    // brain.questiongroup[questionnumber].questionAnswers = true;
    bool? correctans = brain.getQuestionAnswer();
    setState(() {
      if (whatuserpicked == correctans) {
        rightanswers++;
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (brain.isfinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "لقد انتهينا ",
          desc: "لقد اجبت علي $rightanswersمن اصل 7 ",
          buttons: [
            DialogButton(
              child: Text(
                "ابدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        brain.reset();
        answerResult = [];
        rightanswers = 0;
      } else {
        brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answerResult),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(brain.getQuestionImage()),
                const SizedBox(
                  height: 10,
                ),
                Text(brain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            )),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                checkanswers(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'نعم',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                checkanswers(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'لا',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
