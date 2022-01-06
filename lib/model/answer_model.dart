class AnswerModel {
  final int id;
  final String answerTag;
  final String answerDescription;
  final int scoresPositive;
  final int scoresNegative;
  bool isSelected;

  AnswerModel(this.id, this.answerDescription, this.answerTag,
      this.scoresPositive, this.scoresNegative, this.isSelected);

  void isCardSelected() {
    isSelected = !isSelected;
  }
}
