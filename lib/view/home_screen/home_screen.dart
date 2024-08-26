import 'package:flutter/material.dart';
import 'package:quiz_app/view/Result_screen/Result_screen.dart';
import 'package:quiz_app/view/dummy_db.dart';
import 'package:quiz_app/view/options_card/options_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int questionIndex = 0;
  int? answerIndex;
  int rightAnswerCount = 0;
  int wrongAnswers = 0;
  int skippedQuestions = 0;
  int yourScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            _buildQuestionSection(),
            const SizedBox(height: 30),
            Column(
              children: List.generate(
                4,
                (index) => OptionCard(
                  onTap: () {
                    if (answerIndex == null) {
                      setState(() {
                        answerIndex = index;
                      });
                    }
                  },
                  questionIndex: questionIndex,
                  optionIndex: index,
                  col: getColor(index), optionindex: index,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: _handleNext,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Center(
              child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
        ),
      ),
    );
  }

  void _handleNext() {
    if (answerIndex != null) {
      // Check if the selected answer is correct
      if (answerIndex == DummyDb.questions[questionIndex]['answer']) {
        rightAnswerCount++;
        yourScore += 10; // Example scoring logic
      } else {
        wrongAnswers++;
      }
    } else {
      skippedQuestions++;
    }

    // Move to the next question or end the quiz
    if (questionIndex < DummyDb.questions.length - 1) {
      setState(() {
        answerIndex = null;
        questionIndex++;
      });
    } else {
      // End of quiz, navigate to the ResultScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: yourScore,
            correctAnswers: rightAnswerCount,
            wrongAnswers: wrongAnswers,
            skippedQuestions: skippedQuestions,
          ),
        ),
      );
    }
  }

  Color getColor(int index) {
    if (answerIndex != null) {
      if (index == DummyDb.questions[questionIndex]['answer']) {
        return Colors.green; // Correct answer
      }
      if (answerIndex == index) {
        return Colors.red; // Wrong answer selected
      }
    }
    return Colors.white; // Default option color
  }

  Widget _buildQuestionSection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey,
        ),
        child: Text(
          DummyDb.questions[questionIndex]['question'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
