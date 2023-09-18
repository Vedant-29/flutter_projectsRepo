class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String>answers;

  List<String> getShuffledAnswers() {
    // basically allowing the list items to get shuffled but also creating new list to store the shuffled options.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}