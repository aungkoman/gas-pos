import 'branch.dart';

class Business {
  int id;
  String name;
  String description;

  List<Branch> branches;

  Business({required this.id, required this.name, required this.description, required this.branches});
}
