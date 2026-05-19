import 'identity.dart';

class Category implements Identity {
  @override final int? id;
  final String name;
  final String type;

  const Category({this.id, required this.name, required this.type});

  factory Category.fromMap(Map<String, dynamic> map) =>
      Category(id: map['id'], name: map['name'], type: map['type']);

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'type': type};
}