class QuizModel {
  final int number;
  final String question;
  final List<String> options;
  final String correctAnswer;
  String? answer;

  QuizModel({
    required this.number,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'answer': answer,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      number: map['number'] ?? '',
      question: map['question'] ?? '',
      options: map['options'] ?? '',
      correctAnswer: map['correctAnswer'] ?? '',
      answer: map['answer'] ?? '',
    );
  }
}
