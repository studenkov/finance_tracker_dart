abstract class Repository<T> {
  void create(T item);
  List<T> readAll();
  void update(T item);
  void delete(int id);
}