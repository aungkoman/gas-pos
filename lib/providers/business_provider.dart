import 'package:flutter/cupertino.dart';
import 'package:gaspos/models/business.dart';

class BusinessProvider extends ChangeNotifier {
  List<Business> businesses = [
    Business(id: 1, name: "Denko" , description: "the Number One Fuel Station in Myanmar"),
    Business(id: 2, name: "Regency", description: "Myanmar Energy Monitor / Companies. Fuel distribution"),
    Business(id: 3, name: "Ma Cho Mee Mee" , description: "Affordable fuel station in Pyin Oo Lwin")
  ];

  Business selectedBusiness = Business(id: 0, name: "", description: "");

  void createNewBusiness({required String name, required String description}){
    Business newBusiness = Business(id: businesses.length + 1 , name: name, description:  description);
    businesses.add(newBusiness);
    notifyListeners();
  }

  void setSelectedBusiness({required Business business}){
    selectedBusiness = business;
    notifyListeners();
  }
}