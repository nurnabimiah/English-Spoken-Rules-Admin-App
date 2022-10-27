
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:english_spoken_rules_admin/pages/verblist_page.dart';
import 'package:english_spoken_rules_admin/pages/word_meaning_page.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsertWord extends StatefulWidget {
  static const String routeName = '/insert_word';

  @override
  State<InsertWord> createState() => _InsertWordState();
}

class _InsertWordState extends State<InsertWord> {
  final _formkey = GlobalKey<FormState>();
  String? _category;
  bool _isInit = true;
  late WordProvider _wordProvider;
  WordMeaningModel _wordMeaningModel = WordMeaningModel();
  String? wId;


  @override
  void didChangeDependencies() {
    if (_isInit) {
      _wordProvider = Provider.of<WordProvider>(context);
      _wordProvider.init().then((value) {
        _isInit = false;
      });
    }

   // print("1 insert...............................................}");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    wId = ModalRoute
        .of(context)!
        .settings
        .arguments as String?;
    //final wordId = wId[0];
    print("insert 1 ...............................................}");
    print("insert 2 ...............................................+ ${wId}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Word'),
        actions: [
          IconButton(
              onPressed: _saveWord,
              icon: Icon(Icons.save))
        ],
      ),

      body: _isInit ? Center(child: CircularProgressIndicator(),) : Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            TextFormField(
              //maxLines: 2,
             // initialValue: _wordMeaningModel.englishWord,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
              onSaved: (value) {
                _wordMeaningModel.englishWord = value;
               // print("insert 5 ...............................................+ ${wId}");
               // if(wId != null) value = _wordMeaningModel.englishWord;

              },
              decoration: InputDecoration(
                labelText: 'English Word',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              //maxLines: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
              onSaved: (value) {
                _wordMeaningModel.banglaMeaning = value;
              },
              decoration: InputDecoration(
                labelText: 'Bangla Meaning',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),

              hint: Text('Select Category'),
              value: _category,
              onChanged: (value) {
                setState(() {
                  _category = value;
                });
              },
              onSaved: (value) {
                _wordMeaningModel.category = value;
              },
              items: _wordProvider.categoryList.map((cat) =>
                  DropdownMenuItem(
                    child: Text(cat),
                    value: cat,
                  )).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),


          ],
        ),
      ),


    );
  }

  void _saveWord() {
   if(wId == null){
     print("insert 3 ...............................................+ ${wId}");
     if (_formkey.currentState!.validate()) {
       _formkey.currentState!.save();
       _wordProvider.insertNewWord(_wordMeaningModel).then((value) {
         Navigator.pushReplacementNamed(context, AddtoWord.routeName);
       });
     }
   }
    else {
     print("insert 4 ...............................................+ ${wId}");
     if (_formkey.currentState!.validate()) {
       _formkey.currentState!.save();
       _wordProvider.updateFromWord(wId!, _wordMeaningModel).then((value) {
         Navigator.pushReplacementNamed(context, AddtoWord.routeName);
       });
     }

    }
  }


}

