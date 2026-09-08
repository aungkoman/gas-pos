import 'package:flutter/cupertino.dart';
import 'package:gaspos/models/business.dart';

class BusinessProvider extends ChangeNotifier {
  List<Business> businesses = [
    Business(id: 1, name: "Denko" , description: "the Number One Fuel Station in Myanmar", branches: []),
    Business(id: 2, name: "Regency", description: "Myanmar Energy Monitor / Companies. Fuel distribution", branches: []),
    Business(id: 3, name: "Ma Cho Mee Mee" , description: "Affordable fuel station in Pyin Oo Lwin", branches: [])
  ];

  Business selectedBusiness = Business(id: 0, name: "", description: "", branches: []);

  void createNewBusiness({required String name, required String description}){
    Business newBusiness = Business(id: businesses.length + 1 , name: name, description:  description, branches: []);
    businesses.add(newBusiness);
    notifyListeners();
  }

  void setSelectedBusiness({required Business business}){
    selectedBusiness = business;
    notifyListeners();
  }

  void updateBusiness({required int id, required String name, required String description}){
    // 1. Find the index of the business with the matching ID
    int index = businesses.indexWhere((business) => business.id == id);

    // 2. If the business exists in the list (-1 means not found)
    if (index != -1) {
      // Create the updated business instance
      Business updatedBusiness = Business(id: id, name: name, description: description, branches: []);

      // Update the item in the list
      businesses[index] = updatedBusiness;

      // 3. Keep the selectedBusiness in sync if it's the one being updated
      if (selectedBusiness.id == id) {
        selectedBusiness = updatedBusiness;
      }

      // 4. Notify listeners to rebuild the UI
      notifyListeners();
    }
  }

  void deleteBusiness({required int id}){
    // 1. Find the index of the business with the matching ID
    int index = businesses.indexWhere((business) => business.id == id);

    // 2. If the business exists in the list (-1 means not found)
    if (index != -1) {
      businesses.removeAt(index);
      // 4. Notify listeners to rebuild the UI
      notifyListeners();
    }
  }
}