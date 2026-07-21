class QuizModel {
  final String question;
  final List<String> answers;

 const QuizModel({
    required this.question,
    required this.answers,
  });
 List<String> shuffledList(){
   final list = [...answers];
   list.shuffle();
   return list;
 }
}