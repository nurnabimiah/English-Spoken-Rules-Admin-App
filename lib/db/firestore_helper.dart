



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:english_spoken_rules_admin/models/verb_model.dart';
import 'package:english_spoken_rules_admin/models/word_models.dart';

class DbHelper {
  static const String _collectionWord = 'Words';
  static const String _collectionCategory ='Categories';
  static const String _collectionVerbCategory ='VerbCategory';
  static const String _collectionRules = 'Rules';
  static const String _collectionVerbs = 'Verbs';


  static FirebaseFirestore _db = FirebaseFirestore.instance;



  // categories golo tole niye asbo
  static Stream<QuerySnapshot<Map<String,dynamic>>> getCategories() => _db.collection(_collectionCategory).snapshots();
  static Stream<QuerySnapshot<Map<String,dynamic>>> getVerbCategories() => _db.collection(_collectionVerbCategory).snapshots();



// database batch operation
  static Future<void> addNewProduct(WordMeaningModel wordMeaningModel){
    final wb = _db.batch();
    final wordDocRef = _db.collection(_collectionWord).doc();
    wordMeaningModel.wordId = wordDocRef.id;
    wb.set(wordDocRef, wordMeaningModel.toMap());
    return wb.commit();
  }

  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllWord() => _db.collection(_collectionWord).snapshots();

  // ekta item k remove korar jonno
  static Future<void> removeWord(String wordId,) {
    return _db.collection(_collectionWord)
        .doc(wordId)
        .delete();
  }

  static Future<void> updateWord(String wordId,WordMeaningModel wordMeaningModel) {
    print(" ...............................................+ I am update");
    print(" ............................................... + ${wordMeaningModel.englishWord}");
    return _db.collection(_collectionWord)
        .doc(wordId)
        .update(wordMeaningModel.toMap());
  }






  //............................. spoken rules data insert.................

static Future<void> addRules (SpokenRulesModel spokenRulesModel) {
    final wb = _db.batch();
    final rulesDocRef = _db.collection(_collectionRules).doc();
    // rulesDocRef = spokenRulesModel.id;
    spokenRulesModel.id = (rulesDocRef.id);
    wb.set(rulesDocRef, spokenRulesModel.toMap());
    return wb.commit();
 /* return _db.collection(_collectionRules).doc(spokenRulesModel.rulesNumber)
      .set(spokenRulesModel.toMap());*/

}


//......................................spoken rules data get from firebse.......................

  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllRules() => _db.collection(_collectionRules).snapshots();



  // ......................spoken rules delete one item by id ...................................

  static Future<void> removeRules(String id,) {
    return _db.collection(_collectionRules)
        .doc(id)
        .delete();
  }

  // .....................spoken rules update item by id.......................

  static Future<void> updateRules(String id,SpokenRulesModel spokenRulesModel) {
    return _db.collection(_collectionWord)
        .doc(id)
        .update(spokenRulesModel.toMap());
  }






  //...................................verb Insert..................

// database batch operation
  static Future<void> addNewVerb(VerbModel verbModel){
    final wb = _db.batch();
    final verbDocRef = _db.collection(_collectionVerbs).doc();
    verbModel.verbId = verbDocRef.id;
    wb.set(verbDocRef, verbModel.toMap());
    return wb.commit();
  }


}