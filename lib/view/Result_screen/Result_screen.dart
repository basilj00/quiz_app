import 'package:flutter/material.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedQuestions,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 40),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 60),
                      Text(
                        "x", 
                        style: TextStyle(color: Colors.black,fontSize: 40),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.star, color: Colors.yellow, size: 40),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "CONGRATULATIONS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                "Correct answers: ${widget.correctAnswers}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Wrong answers: ${widget.wrongAnswers}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Skipped Questions: ${widget.skippedQuestions}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(120, 30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.repeat_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Retry",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
