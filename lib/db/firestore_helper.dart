

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_spoken_rules_admin/models/word_models.dart';

class DbHelper {
  static const String _collectionWord = 'Words';
  static const String _collectionCategory ='Categories';

  static FirebaseFirestore _db = FirebaseFirestore.instance;



  // categories golo tole niye asbo

  static Stream<QuerySnapshot<Map<String,dynamic>>> getCategories() => _db.collection(_collectionCategory).snapshots();


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



}