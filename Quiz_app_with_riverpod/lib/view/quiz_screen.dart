import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/data.dart';
import 'package:quiz_app_with_riverpod/provider/quiz_provider.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(QuizProvider);

    final quizQuestion = questions[quizState.currentIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizQuestion.question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...quizQuestion.shuffledList().map((answer) {
              return customButton(answer, ref);
            }),
          ],
        ),
      ),
    );
  }

  Widget customButton(String answer, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: ElevatedButton(
        onPressed: () {
          ref.read(QuizProvider.notifier).saveAnswers(answer);
        },

        child: Text(answer),
      ),
    );
  }
}
