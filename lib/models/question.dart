class Question {
  final String question;
  final List<String> options;
  final int answerIndex;
  final int score;

  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.score,
  });
}
