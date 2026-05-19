import 'identity.dart';

class Account implements Identity {
  @override final int? id;
  final int userId;
  final String name;
  final double balance;

  const Account({
    this.id,
    required this.userId,
    required this.name,
    required this.balance
  });

  factory Account.fromMap(Map<String, dynamic> map) =>
      Account(
          id: map['id'],
          userId: map['userId'],
          name: map['name'],
          balance: map['balance']
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'name': name,
    'balance': balance
  };
}