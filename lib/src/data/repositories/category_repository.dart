import 'package:sqlite3/sqlite3.dart';
import '../../domain/models/category.dart';
import '../../domain/interfaces/repository.dart';

class CategoryRepository implements Repository<Category> {
  final Database db;
  CategoryRepository(this.db);

  @override
  void create(Category cat) => db.execute('INSERT INTO categories (id, name, type) VALUES (?, ?, ?)', [cat.id, cat.name, cat.type]);
  @override
  List<Category> readAll() => db.select('SELECT * FROM categories').map((row) => Category.fromMap(row)).toList();
  @override
  void update(Category cat) => db.execute('UPDATE categories SET name = ?, type = ? WHERE id = ?', [cat.name, cat.type, cat.id]);
  @override
  void delete(int id) => db.execute('DELETE FROM categories WHERE id = ?', [id]);
}