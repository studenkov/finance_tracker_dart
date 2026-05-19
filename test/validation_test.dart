import 'package:test/test.dart';
import 'package:finance_tracker_dart/mmm.dart';

void main() {
  test('Empty string returns error', () {
    expect(validateNotEmpty(''), isNotNull);
    expect(validateNotEmpty('   '), isNotNull);
  });

  test('Valid string returns null', () {
    expect(validateNotEmpty('Valid text'), isNull);
  });

  test('Number validator checks', () {
    expect(validatePositiveAmount('-5'), isNotNull);
    expect(validatePositiveAmount('abc'), isNotNull);
    expect(validatePositiveAmount('10.5'), isNull);
  });
}