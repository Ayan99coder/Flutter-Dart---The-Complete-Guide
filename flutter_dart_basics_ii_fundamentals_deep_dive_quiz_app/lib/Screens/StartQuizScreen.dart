import 'package:flutter/material.dart';
import 'package:flutter_dart_basics_ii_fundamentals_deep_dive_quiz_app/provider/QuizProvider.dart';
import 'package:provider/provider.dart';

class StartQuiz extends StatelessWidget {
 const StartQuiz({super.key});
  @override
  Widget build(BuildContext context) {
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
              context.read<QuizProviders>().start();
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
