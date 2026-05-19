import 'package:test/test.dart';
import 'package:finance_tracker_dart/mmm.dart';

void main() {
  test('User toMap and fromMap validation', () {
    final user = User(id: 1, name: 'Test', email: 'test@test.com');
    final map = user.toMap();

    expect(map['name'], 'Test');

    final restoredUser = User.fromMap(map);
    expect(restoredUser.id, 1);
    expect(restoredUser.email, 'test@test.com');
  });
}