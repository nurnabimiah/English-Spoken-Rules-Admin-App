
import 'package:english_spoken_rules_admin/db/firestore_helper.dart';
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:flutter/material.dart';

class WordProvider extends ChangeNotifier{

  //WordMeaningModel wordMeaningModel = WordMeaningModel();
  List <String> categoryList = [];
  List <WordMeaningModel> wordList = [];





  Future<void> init()async{
    _getAllCategories();
    _getALlWords();

  }


  Future<void > insertNewWord (WordMeaningModel wordMeaningModel){
    return DbHelper.addNewProduct(wordMeaningModel);
  }


  void _getAllCategories(){
    DbHelper.getCategories().listen((snapshot) {
     /* print("0 ...............................................}");
      print("-1 ...............................................${snapshot.docs[0]}");*/
      categoryList = List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['name']);
      //print("1.........................}");
      notifyListeners();

    });
   /* print("2.........................}");
     print(".........................${categoryList}");*/
  }

 void _getALlWords(){
   DbHelper.fetchAllWord().listen((event) {
     wordList = List.generate(event.docs.length,
             (index) =>WordMeaningModel.fromMap(event.docs[index].data()));
     notifyListeners();
   });
 }


//insert word

  /*Future<void > insertNewWord (WordMeaningModel wordMeaningModel){
    return DbHelper.addNewWord(wordMeaningModel);
    notifyListeners();

  }*/


}