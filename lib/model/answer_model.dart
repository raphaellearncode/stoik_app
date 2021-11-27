class AnswerModel {
  final int id;
  final String answerTag;
  final String answerDescription;
  final int scoresPositive;
  final int scoresNegative;

  AnswerModel(this.id, this.answerDescription, this.answerTag,
      this.scoresPositive, this.scoresNegative);
}
