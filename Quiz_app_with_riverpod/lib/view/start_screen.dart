import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_with_riverpod/provider/quiz_provider.dart';
class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 80),
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),

          Text(
            "Learn flutter the fun way",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 40),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){
              ref.read(QuizProvider.notifier).startQuiz();
            },
            label: Text('Press here '),

            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,

              shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              side: BorderSide(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
