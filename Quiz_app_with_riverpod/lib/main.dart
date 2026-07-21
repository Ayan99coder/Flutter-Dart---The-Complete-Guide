import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/provider/quiz_provider.dart';
import 'package:quiz_app_with_riverpod/view/quiz_screen.dart';
import 'package:quiz_app_with_riverpod/view/result_screen.dart';
import 'package:quiz_app_with_riverpod/view/start_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(QuizProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: quizState.isStarted
          ? (quizState.isFinished ? ResultScreen() : QuizScreen())
          : StartScreen(),
    );
  }
}
