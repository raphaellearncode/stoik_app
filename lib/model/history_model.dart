class HistoryModel {
  final int id;

  final int historyCategory;
  final String title;
  final String historyDescription;
  final List<String> answers;
  final int scores;

  HistoryModel(this.id, this.historyCategory, this.historyDescription,
      this.title, this.answers, this.scores);
}
