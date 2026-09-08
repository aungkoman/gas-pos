import 'package:flutter/cupertino.dart';
import 'package:gaspos/models/business.dart';

import '../models/branch.dart';

class BranchProvider extends ChangeNotifier{
  // state
  List<Branch> branches = [
    Branch(id: 1, name: "Denko Pyigyi Tagon", description: "ပြည်ကြီးတံခွန်ရဲ့ အကောင်းဆုံး ဆီပန့်ဆိုင်", businessId: 1, business: Business(id: 1, name: "Denko", description: "မြန်မာ့အကောင်းဆုံး ဆီကွန်ယက် ", branches: [])),
    Branch(id: 2, name: "Denko Pobba Thiri", description: "နေပြည်တော် အကောင်းဆုံး ဆီပန့်ဆိုင်", businessId: 1, business: Business(id: 1, name: "Denko", description: "မြန်မာ့အကောင်းဆုံး ဆီကွန်ယက် ", branches: [])),
  ];
  Branch selectedBranch = Branch(id: 0, name: "", description: "", businessId: 0, business: Business(id: 0, name: "", description: "", branches: []));

  void createNewBranch({required String name, required String description, required int businessId}){
    Branch newBranch = Branch(id: branches.length+1, name: name, description: description, businessId: businessId, business: Business(id: 0, name: "name", description: description, branches: []));
    branches.add(newBranch);
    notifyListeners();

  }
}