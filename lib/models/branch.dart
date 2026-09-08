import 'business.dart';

class Branch{
  int id;
  String name;
  String description;

  int businessId;
  Business business;

  Branch({
    required this.id,
    required this.name,
    required this.description,
    required this.businessId,
    required this.business
  });
}