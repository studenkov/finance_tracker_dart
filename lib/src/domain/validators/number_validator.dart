String? validatePositiveAmount(String? value) {
  if (value == null || value.trim().isEmpty) return 'Ошибка: поле не может быть пустым.';
  final number = double.tryParse(value.trim());
  if (number == null) return 'Ошибка: некорректный формат числа.';
  if (number <= 0) return 'Ошибка: значение должно быть больше 0.';
  return null;
}

String? validateInt(String? value) {
  if (value == null || value.trim().isEmpty) return 'Ошибка: поле не может быть пустым.';
  if (int.tryParse(value.trim()) == null) return 'Ошибка: введите целое число.';
  return null;
}