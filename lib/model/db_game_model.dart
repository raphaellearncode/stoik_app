class Game {
  int? id;
  int? scoresPositive;
  int? scoresNegative;
  double? date;

  Game(
      {this.id,
      required this.scoresNegative,
      required this.scoresPositive,
      required this.date});

  Map<String, Object?> toMap() {
    var map = <String, dynamic>{
      'scores_positive': scoresPositive,
      'scores_negative': scoresNegative,
      'game_date': date
    };
    if (id != null) {
      map['game_id'] = id;
    }
    return map;
  }

  Game.fromMap(dynamic map) {
    id = map['game_id'] as int?;
    scoresPositive = map['scores_positive'] as int?;
    scoresNegative = map['scores_negative'] as int?;
    date = map['game_date'] as double?;
  }
}
