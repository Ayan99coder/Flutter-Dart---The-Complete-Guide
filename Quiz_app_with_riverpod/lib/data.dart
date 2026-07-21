
import 'package:quiz_app_with_riverpod/model/Quiz_model.dart';

final questions = [
  QuizModel(
    question: "What is Flutter?",
    answers:  [
      "A UI toolkit",
      "A Database",
      "An Operating System",
      "A Programming Language",
    ],
  ),

   QuizModel(
    question: "Which language is used to develop Flutter apps?",
    answers: [
      "Dart",
      "Java",
      "Kotlin",
      "Swift",
    ],
  ),

   QuizModel(
    question: "Who developed Flutter?",
    answers: [
      "Google",
      "Microsoft",
      "Apple",
      "Facebook",
    ],
  ),

  QuizModel(
    question: "Which widget is immutable?",
    answers: [
      "StatelessWidget",
      "StatefulWidget",
      "InheritedWidget",
      "Container",
    ],
  ),

   QuizModel(
    question: "Which widget can rebuild its UI?",
    answers: [
      "StatefulWidget",
      "StatelessWidget",
      "SizedBox",
      "Padding",
    ],
  ),

   QuizModel(
    question: "Which keyword creates a constant object?",
    answers: [
      "const",
      "final",
      "var",
      "late",
    ],
  ),

  QuizModel(
    question: "Which package is used for Riverpod in Flutter?",
    answers: [
      "flutter_riverpod",
      "riverpod_core",
      "provider",
      "flutter_provider",
    ],
  ),

   QuizModel(
    question: "Which method is required inside a Notifier class?",
    answers: [
      "build()",
      "create()",
      "initState()",
      "dispose()",
    ],
  ),

  QuizModel(
    question: "Which method listens for state changes?",
    answers: [
      "ref.watch()",
      "ref.read()",
      "notifyListeners()",
      "setState()",
    ],
  ),

  QuizModel(
    question: "Which method is used to update immutable state?",
    answers: [
      "copyWith()",
      "clone()",
      "replace()",
      "update()",
    ],
  ),
];