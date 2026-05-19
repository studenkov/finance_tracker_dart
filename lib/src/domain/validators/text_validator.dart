String? validateNotEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Ошибка: строка не может быть пустой';
  }
  return null;
}