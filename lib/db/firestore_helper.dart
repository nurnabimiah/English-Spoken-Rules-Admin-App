



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_spoken_rules_admin/models/antonyme_model.dart';
import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:english_spoken_rules_admin/models/verb_model.dart';
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:english_spoken_rules_admin/models/synoname_model.dart';




class DbHelper {
  static const String _collectionAdmin = 'Admins';
  static const String _collectionWord = 'Words';
  static const String _collectionCategory ='Categories';
  static const String _collectionVerbCategory ='VerbCategory';
  static const String _collectionRules = 'Rules';
  static const String _collectionVerbs = 'Verbs';
  static const String _collectionSynonyms = 'Synonyms';
  static const String _collectionAntonyms = 'Antonyms';



  static FirebaseFirestore _db = FirebaseFirestore.instance;

//admin cheack
  static Future <bool> checkAdmin (String email) async{
    final snapshot = await _db.collection(_collectionAdmin)
        .where('email',isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty; // return krbe true
  }


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

  static Future<void> addNewVerb(verbModel){
    final wb = _db.batch();
    final verbDocRef = _db.collection(_collectionVerbs).doc();
    verbModel.verbId = verbDocRef.id;
    wb.set(verbDocRef, verbModel.toMap());
    return wb.commit();
  }

  // ................................fetch all verbs....................

  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllVerb() => _db.collection(_collectionVerbs).snapshots();

  // .........................verb item delete.....................

  static Future<void> removeVerbList(String id,) {
    return _db.collection(_collectionVerbs)
        .doc(id)
        .delete();
  }


  //.......................Synoname insert data.......................

 static Future<void> addSynoname(SynonameModel synonameModel){
   final wb = _db.batch();
   final synonymDocRef = _db.collection(_collectionSynonyms).doc();
   synonameModel.synonameId = synonymDocRef.id;
   wb.set(synonymDocRef, synonameModel.toMap());
   return wb.commit();

 }

 // ...........fetach all synonymes...............
  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllSynonyms() => _db.collection(_collectionSynonyms).snapshots();

  //.................remove synonyms List...................

  static Future<void> removeSynonymsList(String id,) {
    return _db.collection(_collectionSynonyms)
        .doc(id)
        .delete();
  }



  //.......................antonyms insert data.......................

  static Future<void> addAntonyms(AntonymeModel antonymeModel){
    final wb = _db.batch();
    final antonymsDocRef = _db.collection(_collectionAntonyms).doc();
    antonymeModel.antonymId = antonymsDocRef.id;
    wb.set(antonymsDocRef, antonymeModel.toMap());
    return wb.commit();

  }

  // ...........fetach all antonyms...............
  static Stream<QuerySnapshot<Map<String,dynamic>>>
  fetchAllAntonyms() => _db.collection(_collectionAntonyms).snapshots();

  //.................remove antonyms List...................

  static Future<void> removeAntonymsList(String id,) {
    return _db.collection(_collectionAntonyms)
        .doc(id)
        .delete();
  }




}