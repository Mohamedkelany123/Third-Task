import 'package:flutter/material.dart';
import 'package:week2_trial/quiz%20model/quiz.dart';
import 'package:week2_trial/resluts.dart';
int grade=0;

class QuestionScreen extends StatefulWidget {
  final int index;
  QuestionScreen(this.index);

  @override
  _State createState() => _State();
}

class _State extends State<QuestionScreen> {
  Quiz myQuiz = Quiz();
  bool isCorrect = false;
  bool isWrong = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              myQuiz.quiz[widget.index].question,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Visibility(
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 70.0,
              ),
              visible: isCorrect,
              replacement: Visibility(
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 70.0,
                ),
                visible: isWrong,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: (){
                    if (myQuiz.quiz[widget.index].answer == true)
                      setState(() {
                        isCorrect = true;
                        isWrong = false;
                        grade++;
                      });
                    else setState(() {
                      isCorrect = false;
                      isWrong = true;
                    });
                  },
                  child: Container(
                    width: 150.0,
                    height: 70.0,
                    child: Center(
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    if (myQuiz.quiz[widget.index].answer == false)
                      setState(() {
                        isCorrect = true;
                        isWrong = false;
                        grade++;
                      });
                    else setState(() {
                      isCorrect = false;
                      isWrong = true;
                    });
                  },
                  child: Container(
                    width: 150.0,
                    height: 70.0,
                    child: Center(
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                if(widget.index==4)
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>ResultsScreen()));
                }
                else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(widget.index+1),
                  ),
                );
                }
              },
              child: Container(
                width: 250.0,
                height: 70.0,
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


