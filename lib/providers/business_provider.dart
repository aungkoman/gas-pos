import 'package:flutter/cupertino.dart';
import 'package:gaspos/models/business.dart';

class BusinessProvider extends ChangeNotifier {
  List<Business> businesses = [
    Business(id: 1, name: "Denko"),
    Business(id: 2, name: "Regency"),
    Business(id: 3, name: "Ma Cho Mee Mee")
  ];
}