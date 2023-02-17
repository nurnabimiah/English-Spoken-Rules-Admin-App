
class AntonymeModel {
  String? antonymId;
  String? mainword;
  String? banglaMeaning;
  String? antonym;

  AntonymeModel({
    this.antonymId,
    this.mainword,
    this.banglaMeaning,
    this.antonym});


  Map<String,dynamic> toMap(){

    var map = <String,dynamic>{
      'antonymId': antonymId,
      'mainword' : mainword,
      'banglaMeaning' : banglaMeaning,
      'antonym' : antonym,
    };
    return map;


  }


  factory AntonymeModel.fromMap(Map<String,dynamic> map) => AntonymeModel(

    antonymId :map['antonymId'],
    mainword: map['mainword'],
    banglaMeaning: map['banglaMeaning'],
    antonym: map['antonym'],
  );



}