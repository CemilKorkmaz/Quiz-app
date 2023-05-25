import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.castoro(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTop: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}

























// Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       const Text('What are the main building blocks of Flutter UIs?',
    //           style: TextStyle(fontSize: 28)),
    //       const SizedBox(
    //         height: 30,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('Functions'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('Components'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('Blocks'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('Widgets'),
    //       ),
    //     ],
    //   ),
    // );