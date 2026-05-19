import 'package:sqlite3/sqlite3.dart';
import '../../domain/models/transaction.dart';
import '../../domain/interfaces/repository.dart';

class TransactionRepository implements Repository<Transaction> {
  final Database db;
  TransactionRepository(this.db);

  @override
  void create(Transaction t) => db.execute('INSERT INTO transactions (id, accountId, categoryId, amount, date, description) VALUES (?, ?, ?, ?, ?, ?)', [t.id, t.accountId, t.categoryId, t.amount, t.date.toIso8601String(), t.description]);
  @override
  List<Transaction> readAll() => db.select('SELECT * FROM transactions').map((row) => Transaction.fromMap(row)).toList();
  @override
  void update(Transaction t) => db.execute('UPDATE transactions SET amount = ?, description = ? WHERE id = ?', [t.amount, t.description, t.id]);
  @override
  void delete(int id) => db.execute('DELETE FROM transactions WHERE id = ?', [id]);
}