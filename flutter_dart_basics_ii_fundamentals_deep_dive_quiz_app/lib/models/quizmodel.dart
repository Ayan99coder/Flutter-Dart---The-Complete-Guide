class QuizModel {
  QuizModel({required this.question,required this.answere});
  String question;
  List<String> answere;
  List<String> getShuffleMethod(){
    final shuffled = List.of(answere);
    shuffled.shuffle();
    return shuffled;
  }

}
