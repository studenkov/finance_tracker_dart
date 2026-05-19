import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/account_repository.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/transaction_repository.dart';
import '../data/repositories/goal_repository.dart';
import '../domain/models/user.dart';
import '../domain/models/account.dart';
import '../domain/models/category.dart';
import '../domain/models/transaction.dart';
import '../domain/models/goal.dart';
import '../domain/validators/text_validator.dart';
import '../domain/validators/number_validator.dart';
import 'input_helper.dart';

class Menu {
  final UserRepository userRepo;
  final AccountRepository accRepo;
  final CategoryRepository catRepo;
  final TransactionRepository transRepo;
  final GoalRepository goalRepo;

  Menu(Database db)
      : userRepo = UserRepository(db),
        accRepo = AccountRepository(db),
        catRepo = CategoryRepository(db),
        transRepo = TransactionRepository(db),
        goalRepo = GoalRepository(db);

  void run() {
    while (true) {
      print('\n1. Добавить пользователя\n2. Добавить счет\n3. Добавить категорию\n4. Добавить транзакцию\n5. Добавить цель\n6. Показать всё из БД\n0. Выход');
      stdout.write('Выбор: ');
      switch (stdin.readLineSync()?.trim()) {
        case '1': _createUser(); break;
        case '2': _createAccount(); break;
        case '3': _createCategory(); break;
        case '4': _createTransaction(); break;
        case '5': _createGoal(); break;
        case '6': _showAll(); break;
        case '0': return;
        default: print('Неверный ввод');
      }
    }
  }

  void _createUser() {
    final name = askString('Имя', validateNotEmpty);
    final email = askString('Email', validateNotEmpty);
    userRepo.create(User(name: name, email: email));
  }

  void _createAccount() {
    final userId = askInt('ID пользователя', validateInt);
    final name = askString('Название счета', validateNotEmpty);
    final balance = askDouble('Баланс', validatePositiveAmount);
    accRepo.create(Account(userId: userId, name: name, balance: balance));
  }

  void _createCategory() {
    final name = askString('Название категории', validateNotEmpty);
    final type = askString('Тип', validateNotEmpty);
    catRepo.create(Category(name: name, type: type));
  }

  void _createTransaction() {
    final accountId = askInt('ID счета', validateInt);
    final categoryId = askInt('ID категории', validateInt);
    final amount = askDouble('Сумма', validatePositiveAmount);
    final description = askString('Описание', validateNotEmpty);
    transRepo.create(Transaction(
      accountId: accountId, categoryId: categoryId, amount: amount, date: DateTime.now(), description: description,
    ));
  }

  void _createGoal() {
    final userId = askInt('ID пользователя', validateInt);
    final title = askString('Название цели', validateNotEmpty);
    final targetAmount = askDouble('Целевая сумма', validatePositiveAmount);
    goalRepo.create(Goal(
      userId: userId, title: title, targetAmount: targetAmount, currentAmount: 0.0,
    ));
  }

  void _showAll() {
    print('\nПользователи');
    for (var u in userRepo.readAll()) {
      print('${u.id} | ${u.name} | ${u.email}');
    }

    print('\nСчета');
    for (var a in accRepo.readAll()) {
      print('${a.id} | userId: ${a.userId} | ${a.name} | ${a.balance}');
    }

    print('\nКатегории');
    for (var c in catRepo.readAll()) {
      print('${c.id} | ${c.name} | ${c.type}');
    }

    print('\nТранзакции');
    for (var t in transRepo.readAll()) {
      print('${t.id} | acc: ${t.accountId} | cat: ${t.categoryId} | ${t.amount} | ${t.date.toIso8601String().split("T").first} | ${t.description}');
    }

    print('\nЦели');
    for (var g in goalRepo.readAll()) {
      print('${g.id} | userId: ${g.userId} | ${g.title} | ${g.currentAmount} / ${g.targetAmount}');
    }
  }
}