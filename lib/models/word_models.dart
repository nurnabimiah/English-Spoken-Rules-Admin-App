import 'package:flutter/material.dart';
class WordMeaningModel {
  String? wordId;
  String? englishWord;
  String? banglaMeaning;
  String?category;

  WordMeaningModel(
      {
        this.wordId,
        this.englishWord,
        this.banglaMeaning,
        this.category});

  Map<String,dynamic> toMap(){

    var map = <String,dynamic>{
      'wordId': wordId,
      'englishWord' : englishWord,
      'banglaMeaning' : banglaMeaning,
      'category': category,
    };
    return map;


  }

  factory WordMeaningModel.fromMap(Map<String,dynamic> map) => WordMeaningModel(

    wordId :map['wordId'],
    englishWord: map['englishWord'],
    category: map['category'],
    banglaMeaning: map['banglaMeaning'],

  );

  @override
  String toString() {
    return 'WordMeaningModel{wordId: $wordId, englishWord: $englishWord, banglaMeaning: $banglaMeaning, category: $category}';
  }
}



