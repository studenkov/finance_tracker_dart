import 'package:sqlite3/sqlite3.dart';
import '../../domain/models/goal.dart';
import '../../domain/interfaces/repository.dart';

class GoalRepository implements Repository<Goal> {
  final Database db;
  GoalRepository(this.db);

  @override
  void create(Goal g) => db.execute('INSERT INTO goals (id, userId, title, targetAmount, currentAmount) VALUES (?, ?, ?, ?, ?)', [g.id, g.userId, g.title, g.targetAmount, g.currentAmount]);
  @override
  List<Goal> readAll() => db.select('SELECT * FROM goals').map((row) => Goal.fromMap(row)).toList();
  @override
  void update(Goal g) => db.execute('UPDATE goals SET title = ?, targetAmount = ?, currentAmount = ? WHERE id = ?', [g.title, g.targetAmount, g.currentAmount, g.id]);
  @override
  void delete(int id) => db.execute('DELETE FROM goals WHERE id = ?', [id]);
}