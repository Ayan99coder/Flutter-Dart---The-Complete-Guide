import '../models/quizmodel.dart';

final Questions = [
  QuizModel(
    question: "What are the main building block of Flutter widgets UI",
    answere: ['widgets','functions', 'custom widgets', 'context'],
  ),
  QuizModel(
    question: "What is the purpose of currentQuestionIndex?",
    answere: [
      'To track the current question',
      'To change widget color',
      'To delete a widget',
      'To close the app',
    ],
  ),
  QuizModel(
    question: "What is the main purpose of setState()?",
    answere: [
      'To rebuild/update the UI',
      'To install the app',
      'To delete a widget',
      'To create a variable',
    ],
  ),
  QuizModel(
    question: "What does currentQuestionIndex++ do",
    answere: [
      'Increases the value by 1',
      'Decreases the value by 1',
      'Resets the value to 0',
      'Deletes the value',
    ],
  ),
  QuizModel(
    question: 'When should you use a StatefulWidget?',
    answere: [
      'When UI or data can change',
      'When data never changes',
      'Only for images',
    ],
  ),
];
