import 'dart:io';

String askString(String prompt, String? Function(String?) validator) {
  while (true) {
    stdout.write('$prompt: ');
    final input = stdin.readLineSync();
    final error = validator(input);
    if (error == null) return input!.trim();
    print(error);
  }
}

double askDouble(String prompt, String? Function(String?) validator) {
  final input = askString(prompt, validator);
  return double.parse(input);
}

int askInt(String prompt, String? Function(String?) validator) {
  final input = askString(prompt, validator);
  return int.parse(input);
}