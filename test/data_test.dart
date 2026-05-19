import 'package:sqlite3/sqlite3.dart';
import 'package:test/test.dart';
import 'package:finance_tracker_dart/mmm.dart';

void main() {
  late Database db;
  late UserRepository repo;

  setUp(() {
    db = sqlite3.openInMemory();
    db.execute('CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL)');
    repo = UserRepository(db);
  });

  tearDown(() {
    db.close();
  });

  test('Insert and read from SQLite', () {
    final user = User(id: 1, name: 'Alice', email: 'alice@test.com');
    repo.create(user);

    final users = repo.readAll();
    expect(users.length, 1);
    expect(users.first.name, 'Alice');
  });

  test('Update existing record in SQLite', () {
    final user = User(id: 1, name: 'Alice', email: 'alice@test.com');
    repo.create(user);

    final updatedUser = User(id: 1, name: 'Alice Updated', email: 'new@test.com');
    repo.update(updatedUser);

    final users = repo.readAll();
    expect(users.length, 1);
    expect(users.first.name, 'Alice Updated');
    expect(users.first.email, 'new@test.com');
  });

  test('Delete record from SQLite', () {
    final user = User(id: 1, name: 'Alice', email: 'alice@test.com');
    repo.create(user);

    var users = repo.readAll();
    expect(users.length, 1);

    repo.delete(1);

    users = repo.readAll();
    expect(users.isEmpty, true);
  });
}