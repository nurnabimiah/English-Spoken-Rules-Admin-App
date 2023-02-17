


class SynonameModel {
  String? synonameId;
  String? word;
  String? banglaMeaning;
  String? synoname;

  SynonameModel({
    this.synonameId,
    this.word,
    this.banglaMeaning,
    this.synoname});


  Map<String,dynamic> toMap(){

    var map = <String,dynamic>{
      'synonameId': synonameId,
      'word' : word,
      'banglaMeaning' : banglaMeaning,
      'synoname' : synoname,
    };
    return map;


  }


  factory SynonameModel.fromMap(Map<String,dynamic> map) => SynonameModel(

    synonameId :map['synonameId'],
    word: map['word'],
    banglaMeaning: map['banglaMeaning'],
    synoname: map['synoname'],
  );



}









