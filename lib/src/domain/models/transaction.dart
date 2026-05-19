import 'identity.dart';

class Transaction implements Identity {
  @override
  final int? id;
  final int accountId;
  final int categoryId;
  final double amount;
  final DateTime date;
  final String description;

  const Transaction({
    this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.date,
    required this.description
  });

  factory Transaction.fromMap(Map<String, dynamic> map) =>
      Transaction(
          id: map['id'] as int?,
          accountId: map['accountId'] as int,
          categoryId: map['categoryId'] as int,
          amount: (map['amount'] as num).toDouble(),
          date: DateTime.parse(map['date'] as String),
          description: map['description'] as String
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'accountId': accountId,
    'categoryId': categoryId,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description
  };
}