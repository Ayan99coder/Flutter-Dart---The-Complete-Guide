import 'package:flutter/material.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/Screens/QuizQuestionScreen.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/Screens/StartQuizScreen.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/Screens/result_screen.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/provider/QuizProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => QuizProviders(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepPurpleAccent,
              Colors.deepPurpleAccent.shade400,
            ],
            begin: .topCenter,
            end: .bottomEnd,
          ),
        ),
        child: Consumer<QuizProviders>(
          builder: (context, quizProvider, child) {
            return quizProvider.isQuizStarted
                ? (quizProvider.isQuizFinished
                      ? const ResultScreen()
                      : QuestionScreen())
                : const StartQuiz();
          },
        ),
      ),
    );
  }
}
