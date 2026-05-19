import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

class FinanceDatabase {
  final Database _sqlite;
  Database get sqlite => _sqlite;

  FinanceDatabase(String filePath) : _sqlite = sqlite3.open(filePath) {
    _createTables();
  }

  factory FinanceDatabase.inApp() {
    final path = p.join(Directory.current.path, "finance.db");
    return FinanceDatabase(path);
  }

  void _createTables() {
    _sqlite.execute('''
      CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL);
      CREATE TABLE IF NOT EXISTS accounts(id INTEGER PRIMARY KEY, userId INTEGER NOT NULL, name TEXT NOT NULL, balance REAL NOT NULL, FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE);
      CREATE TABLE IF NOT EXISTS categories(id INTEGER PRIMARY KEY, name TEXT NOT NULL, type TEXT NOT NULL);
      CREATE TABLE IF NOT EXISTS transactions(id INTEGER PRIMARY KEY, accountId INTEGER NOT NULL, categoryId INTEGER NOT NULL, amount REAL NOT NULL, date DATETIME NOT NULL, description TEXT, FOREIGN KEY(accountId) REFERENCES accounts(id) ON DELETE CASCADE, FOREIGN KEY(categoryId) REFERENCES categories(id) ON DELETE RESTRICT);
      CREATE TABLE IF NOT EXISTS goals(id INTEGER PRIMARY KEY, userId INTEGER NOT NULL, title TEXT NOT NULL, targetAmount REAL NOT NULL, currentAmount REAL NOT NULL DEFAULT 0.0, FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE);
    ''');
  }

  void close() => _sqlite.close();
}