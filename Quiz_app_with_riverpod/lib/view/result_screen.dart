import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/data.dart';
import 'package:quiz_app_with_riverpod/provider/quiz_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(QuizProvider);

    final quizNotifier = ref.read(QuizProvider.notifier);

    Color questionColor(int index) {
      if (quizState.selectedAnswers[index] == questions[index].answers[0]) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    final theme = Theme.of(context).textTheme;

    final style = theme.bodyMedium?.copyWith(
      color: Colors.white54,

      fontWeight: FontWeight.w500,

      fontSize: 16,
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'You answered ${quizNotifier.correctAnswers()} out of ${questions.length} correctly!',

              style: theme.titleMedium?.copyWith(
                color: Colors.white54,

                fontSize: 20,

                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 40),

            ...quizNotifier.result().map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 35,

                          height: 35,

                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            color: questionColor(e['index']).withOpacity(0.2),

                            border: Border.all(
                              color: questionColor(e['index']),
                            ),
                          ),

                          child: Text('${e['index'] + 1}', style: style),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(e['question'].toString(), style: style),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Correct: ${e['correct'].toString()}",

                      style: const TextStyle(
                        color: Colors.white54,

                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "Your answer: ${e['select'].toString()}",

                      style: TextStyle(
                        color: questionColor(e['index']),

                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 40),

            OutlinedButton.icon(
              onPressed: () {
                quizNotifier.startQuiz();
              },

              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,

                  vertical: 15,
                ),

                foregroundColor: Colors.white54,
              ),

              icon: const Icon(Icons.restart_alt),

              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
