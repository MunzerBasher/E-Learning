class Question {
  final int id;
  final String text;
  final List<dynamic> options;
  final int correctIndex;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawOptions = json['answers'];
    final List<String> options = rawOptions.map((e) => e.toString()).toList();

    return Question(
      
      id: json['questionId'] as int,
      text: json['questionText'] as String,
      options:json['answers'],
      correctIndex: json['correctAnswerIndex'] as int,
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionText': text, 
      'answers': options,  
      'correctAnswerIndex': correctIndex,
    };
  }

  @override
  String toString() {
    return 'Question(id: $id, text: "$text", options: $options, correctIndex: $correctIndex)';
  }
}

