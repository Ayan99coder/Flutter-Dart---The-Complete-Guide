class QuizState {
  final bool isStarted;
  final bool isFinished;
  final int currentIndex;
  final List<String> selectedAnswers;

  const QuizState({
    required this.isStarted,
    required this.isFinished,
    required this.currentIndex,
    required this.selectedAnswers,
  });

  QuizState copyWith({
    bool? isStarted,
    bool? isFinished,
    int? currentIndex,
    List<String>? selectedAnswers,
  }) {
    return QuizState(
      isStarted: isStarted ?? this.isStarted,
      isFinished: isFinished ?? this.isFinished,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }

}
