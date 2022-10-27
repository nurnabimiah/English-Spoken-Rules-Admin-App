

 class VerbModel{
   String? verbId;
   String? presentForm;
   String? pastFrom;
   String? pastParticipleForm;
   String? verbCategory;
   String? banglaMeaning;


   VerbModel(
      {this.verbId,
      this.presentForm,
      this.pastFrom,
      this.banglaMeaning,
      this.pastParticipleForm,
      this.verbCategory});

  Map<String,dynamic> toMap(){

     var map = <String,dynamic>{
       'verbId': verbId,
       'presentForm' : presentForm,
       'pastFrom' : pastFrom,
       'pastParticipleForm' : pastParticipleForm,
       'banglaMeaning' : banglaMeaning,
       'verbCategory': verbCategory,
     };
     return map;


   }

   factory VerbModel.fromMap(Map<String,dynamic> map) => VerbModel(

     verbId :map['verbId'],
     presentForm: map['presentForm'],
     pastFrom: map['pastFrom'],
     pastParticipleForm: map['pastParticipleForm'],
     verbCategory: map['verbCategory'],
     banglaMeaning: map['banglaMeaning'],

   );

 }