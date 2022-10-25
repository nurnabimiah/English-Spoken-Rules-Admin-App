
import 'package:english_spoken_rules_admin/db/firestore_helper.dart';
import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:flutter/material.dart';

class SpokenRulesProvider extends ChangeNotifier{

  List <SpokenRulesModel> rulesdList = [];


  Future<void > insertNewRules (SpokenRulesModel spokenRulesModel){
    return DbHelper.addRules(spokenRulesModel);
    notifyListeners();
  }


 /* Future<void> init()async{
   getALlRules();
  }
*/

  void getALlRules(){
    DbHelper.fetchAllRules().listen((event) {
      rulesdList = List.generate(event.docs.length,
              (index) =>SpokenRulesModel.fromMap(event.docs[index].data()));
      notifyListeners();
    });
  }

  //...........................remove id ........................

  void removeFromRules(SpokenRulesModel spokenRulesModel) {
    //cartModel.qty = 0;
    DbHelper.removeWord(spokenRulesModel.id!);
  }


}