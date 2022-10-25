

class SpokenRulesModel {

  String? id;
  int? rulesNumber;
  String? rules;
  String? banglaExample1;
  String? englishExample1;
  String? banglaExample2;
  String? englishExample2;
  String? banglaExample3;
  String? englishExample3;
 /* String? banglaExample4;
  String? englishExample4;
  String? banglaExample5;
  String? englishExample5;*/


  SpokenRulesModel({ this.id,
    this.rulesNumber,
    this.rules,
    this.banglaExample1,
    this.englishExample1,
    this.banglaExample2,
    this.englishExample2,
    this.banglaExample3,
    this.englishExample3,
   /* this.banglaExample4,
    this.englishExample4,
    this.banglaExample5,
    this.englishExample5,*/ });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'rulesNumber': rulesNumber,
      'rules': rules,
      'banglaExample1': banglaExample1,
      'englishExample1': englishExample1,
      'banglaExample2': banglaExample2,
      'englishExample2': englishExample2,
      'banglaExample3': banglaExample3,
      'englishExample3': englishExample3,
     /* 'banglaExample4': banglaExample4,
      'englishExample4': englishExample4,
      'banglaExample5': banglaExample5,
      'englishExample5': englishExample5,*/

    };
    return map;
  }

  factory SpokenRulesModel.fromMap(Map<String,dynamic> map) => SpokenRulesModel(

    id :map['id'],
    rulesNumber : map['rulesNumber'],
    rules: map['rules'],
    banglaExample1: map['banglaExample1'],
    englishExample1: map['englishExample1'],
    banglaExample2: map['banglaExample2'],
    englishExample2: map['englishExample2'],
    banglaExample3: map['banglaExample3'],
    englishExample3: map['englishExample3'],
   /* banglaExample4: map['banglaExample4'],
    englishExample4: map['englishExample4'],

    banglaExample5: map['banglaExample5'],
    englishExample5: map['englishExample5'],*/


  );

  @override
  String toString() {
    return 'SpokenRulesModel{id: $id, rulesNumber: $rulesNumber, rules: $rules, banglaExample1: $banglaExample1, englishExample1: $englishExample1, banglaExample2: $banglaExample2, englishExample2: $englishExample2, banglaExample3: $banglaExample3, englishExample3: $englishExample3}';
  }
}