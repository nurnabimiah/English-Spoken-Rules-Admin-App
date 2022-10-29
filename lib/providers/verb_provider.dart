
import 'package:english_spoken_rules_admin/models/verb_model.dart';
import 'package:flutter/material.dart';

import '../db/firestore_helper.dart';

class VerbProvider extends ChangeNotifier{

  List <String> verbCategoryList = [];
  List <VerbModel> verbList = [];





  Future<void> init()async{
    _getAllVerbCategories();

  }


  void _getAllVerbCategories(){
    DbHelper.getVerbCategories().listen((snapshot) {
      /* print("0 ...............................................}");
      print("-1 ...............................................${snapshot.docs[0]}");*/
      verbCategoryList = List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['name']);
      //print("1.........................}");
      notifyListeners();

    });

  }

  Future<void > insertNewVerb (VerbModel verbModel){
    return DbHelper.addNewVerb(verbModel);
  }

  //..........Read all verbs................

  void getALlVerbs(){
    DbHelper.fetchAllVerb().listen((snapshot) {
      verbList = List.generate(snapshot.docs.length,
              (index) =>VerbModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  // ..........remove verb By id........

  void removeFromVerbList(VerbModel verbModel) {

    DbHelper.removeVerbList(
         verbModel.verbId!);
  }




}