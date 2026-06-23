import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/models/quizmodel.dart';
import '../DATA/DataModel.dart';

class QuizProviders extends ChangeNotifier {
  bool isQuizStarted = false;
  bool isQuizFinished = false;
  bool isCorrect = false;
  int currentIndex = 0;

  QuizModel get currentQuestion => Questions[currentIndex];
  List<String> selectedAnswers = [];

  void start() {
    isQuizStarted = true;
    isQuizFinished = false;
    currentIndex = 0;
    selectedAnswers.clear();
    notifyListeners();
  }

  void quizFinished() {
    isQuizFinished = true;
    notifyListeners();
  }

  void nextQuestion(String answer) {
    selectedAnswers.add(answer);

    if (currentIndex < Questions.length-1) {
      currentIndex++;
    } else {
      quizFinished();
    }

    notifyListeners();
  }

  List<Map<String, dynamic>> resultScreen() {
    final List<Map<String, dynamic>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'Question_index': i,
        'Question': Questions[i].question,
        'Correct_answere': Questions[i].answere[0],
        'Your_answere': selectedAnswers[i],
      });
    }

    return summary;
  }

  int correctAnswers() {
    int count = 0;
    for (int i = 0; i < Questions.length; i++) {
      if (selectedAnswers[i] == Questions[i].answere[0]) {
        count++;
      }
    }
    return count;
  }
}
