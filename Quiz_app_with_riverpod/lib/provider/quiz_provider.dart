import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/model/Quiz_state.dart';
import 'package:quiz_app_with_riverpod/viewmodel/quiz_notifier.dart';

final QuizProvider = NotifierProvider<QuizNotifier, QuizState>(
  QuizNotifier.new,
);
