import 'answer_model.dart';

class HistoryModel {
  final int id;

  final int historyNumber;
  final int historyCategory;
  final String title;
  final String historyDescription;
  final List<AnswerModel> answers;

  HistoryModel(this.id, this.historyNumber, this.historyCategory, this.title,
      this.historyDescription, this.answers);
}
