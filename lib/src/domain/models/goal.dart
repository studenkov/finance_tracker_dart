import 'identity.dart';

class Goal implements Identity {
  @override final int? id;
  final int userId;
  final String title;
  final double targetAmount;
  final double currentAmount;

  const Goal({
    this.id,
    required this.userId,
    required this.title,
    required this.targetAmount,
    required this.currentAmount
  });

  factory Goal.fromMap(Map<String, dynamic> map) =>
      Goal(
          id: map['id'],
          userId: map['userId'],
          title: map['title'],
          targetAmount: map['targetAmount'],
          currentAmount: map['currentAmount']
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'targetAmount': targetAmount,
    'currentAmount': currentAmount
  };
}