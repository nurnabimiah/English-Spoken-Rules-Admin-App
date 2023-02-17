
import 'package:english_spoken_rules_admin/models/synoname_model.dart';
import 'package:flutter/material.dart';

import '../db/firestore_helper.dart';

class SynonameProvider extends ChangeNotifier{

  List <SynonameModel> synonymList = [];


  Future <bool> cheackAdmin(String email){
  return DbHelper.checkAdmin(email);
  }

  Future<void > insertNewSynonym (SynonameModel synonameModel){
    return DbHelper.addSynoname(synonameModel);
  }

  void getSynonyms(){
    DbHelper.fetchAllSynonyms().listen((snapshot) {
      synonymList = List.generate(snapshot.docs.length,
              (index) =>SynonameModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  // ..........remove verb By id........

  void removeFromSynonymsList(SynonameModel synonameModel) {

    DbHelper.removeSynonymsList(
        synonameModel.synonameId!);
  }



}