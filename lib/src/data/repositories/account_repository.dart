import 'package:sqlite3/sqlite3.dart';
import '../../domain/models/account.dart';
import '../../domain/interfaces/repository.dart';

class AccountRepository implements Repository<Account> {
  final Database db;
  AccountRepository(this.db);

  @override
  void create(Account acc) => db.execute('INSERT INTO accounts (id, userId, name, balance) VALUES (?, ?, ?, ?)', [acc.id, acc.userId, acc.name, acc.balance]);
  @override
  List<Account> readAll() => db.select('SELECT * FROM accounts').map((row) => Account.fromMap(row)).toList();
  @override
  void update(Account acc) => db.execute('UPDATE accounts SET name = ?, balance = ? WHERE id = ?', [acc.name, acc.balance, acc.id]);
  @override
  void delete(int id) => db.execute('DELETE FROM accounts WHERE id = ?', [id]);
}