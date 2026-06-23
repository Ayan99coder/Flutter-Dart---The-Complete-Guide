import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/QuizProvider.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProviders>().currentQuestion;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizProvider.question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),

            const SizedBox(height: 20),

            ...quizProvider.getShuffleMethod().map(
              (answer) => customButton(context, answer),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(BuildContext context, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          context.read<QuizProviders>().nextQuestion(answer);
        },
        child: Text(answer),
      ),
    );
  }
}
