

import 'package:english_spoken_rules_admin/models/antonyme_model.dart';
import 'package:flutter/material.dart';

import '../db/firestore_helper.dart';

class AntonymProvider extends ChangeNotifier{

  List <AntonymeModel> antonymList = [];

  Future<void > insertNewSynonym (AntonymeModel antonymeModel){
    return DbHelper.addAntonyms(antonymeModel);
  }

  void getAntonyms(){
    DbHelper.fetchAllAntonyms().listen((snapshot) {
      antonymList = List.generate(snapshot.docs.length,
              (index) =>AntonymeModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  // ..........remove verb By id........

  void removeFromAntonymsList(AntonymeModel antonymeModel) {

    DbHelper.removeAntonymsList(
        antonymeModel.antonymId!);
  }



}