import 'package:flutter/material.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/provider/QuizProvider.dart';
import 'package:provider/provider.dart';

import '../DATA/DataModel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProviders>();
    final theme = Theme.of(context).textTheme;
    final quizResult = context.watch<QuizProviders>().resultScreen();
    final correctAnswers = context.watch<QuizProviders>().correctAnswers();
    final style = theme.bodyMedium?.copyWith(
      color: Colors.white54,
      fontWeight: .w500,
      fontSize: 16,
    );
    Color answerColor(int index) {
      if (provider.selectedAnswers[index] == Questions[index].answere[0]) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            'You answered ${correctAnswers} out of 5 correctly!',
            style: theme.titleMedium?.copyWith(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: .w400,
              letterSpacing: 0.1,
            ),
          ),
          SizedBox(height: 40),
          ...quizResult.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: .start,
                children: [

                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: .all(
                            color: answerColor(e['Question_index'] as int),
                          ),
                          color: answerColor(
                            e['Question_index'] as int,
                          ).withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            ((e['Question_index'] as int) + 1).toString(),
                            style: style,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(e['Question'] as String, style: style),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    e['Correct_answere'] as String,
                    textAlign: .start,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: .w300,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    e['Your_answere'] as String,
                    style: TextStyle(
                      color: answerColor(e['Question_index'] as int),
                      fontWeight: .w300,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {
              context.read<QuizProviders>().start();
            },
            style: OutlinedButton.styleFrom(
              padding: .symmetric(horizontal: 40, vertical: 20),
              foregroundColor: Colors.white54,
              side: BorderSide(color: Colors.transparent),
            ),
            label: Text('Restart Quiz'),
            icon: Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
    );
  }
}
