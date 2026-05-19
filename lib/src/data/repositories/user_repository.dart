import 'package:sqlite3/sqlite3.dart';
import '../../domain/models/user.dart';
import '../../domain/interfaces/repository.dart';

class UserRepository implements Repository<User> {
  final Database db;

  UserRepository(this.db);

  @override
  void create(User user) => db.execute('INSERT INTO users (id, name, email) VALUES (?, ?, ?)', [user.id, user.name, user.email]);
  @override
  List<User> readAll() => db.select('SELECT * FROM users').map((row) => User.fromMap(row)).toList();
  @override
  void update(User user) => db.execute('UPDATE users SET name = ?, email = ? WHERE id = ?', [user.name, user.email, user.id]);
  @override
  void delete(int id) => db.execute('DELETE FROM users WHERE id = ?', [id]);
}