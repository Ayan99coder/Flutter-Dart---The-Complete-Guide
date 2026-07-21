import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/data.dart';
import 'package:quiz_app_with_riverpod/model/Quiz_model.dart';
import 'package:quiz_app_with_riverpod/model/Quiz_state.dart';

class QuizNotifier extends Notifier<QuizState> {
  @override
  QuizState build() {
    return const QuizState(
      isStarted: false,

      isFinished: false,

      currentIndex: 0,

      selectedAnswers: [],
    );
  }

  QuizModel get quizQuestion {
    return questions[state.currentIndex];
  }

  void startQuiz() {
    state = state.copyWith(isStarted: true,);
  }

  void saveAnswers(String answer) {
    state = state.copyWith(selectedAnswers: [...state.selectedAnswers, answer]);

    if (state.currentIndex < questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    } else {
      state = state.copyWith(isFinished: true);
    }
  }

  List<Map<String, dynamic>> result() {
    final List<Map<String, dynamic>> summary = [];

    for (int i = 0; i < state.selectedAnswers.length; i++) {
      summary.add({
        "question": questions[i].question,

        "correct": questions[i].answers[0],

        "selected": state.selectedAnswers[i],

        "index": i,
      });
    }

    return summary;
  }

  int correctAnswers() {
    int count = 0;

    for (int i = 0; i < state.selectedAnswers.length; i++) {
      if (state.selectedAnswers[i] == questions[i].answers[0]) {
        count++;
      }
    }

    return count;
  }
}
