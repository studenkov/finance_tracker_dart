import 'package:finance_tracker_dart/mmm.dart';

void main() {
  final db = FinanceDatabase.inApp();
  final menu = Menu(db.sqlite);

  menu.run();

  db.close();
}