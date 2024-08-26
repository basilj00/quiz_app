import 'package:flutter/material.dart';
import 'package:quiz_app/view/dummy_db.dart';

class OptionCard extends StatelessWidget {
  final VoidCallback onTap;
  final int questionIndex;
  final int optionIndex;
  final Color col;

  const OptionCard({
    Key? key,
    required this.onTap,
    required this.questionIndex,
    required this.optionIndex,
    required this.col, required int optionindex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          DummyDb.questions[questionIndex]['options'][optionIndex],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
