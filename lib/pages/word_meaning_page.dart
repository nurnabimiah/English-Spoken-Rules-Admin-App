import 'package:english_spoken_rules_admin/custom_widgets/word_item.dart';
import 'package:english_spoken_rules_admin/pages/insert_word.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/word_models.dart';

class AddtoWord extends StatefulWidget {
  static const String routeName = '/addTo_word';

  @override
  State<AddtoWord> createState() => _AddtoWordState();
}

class _AddtoWordState extends State<AddtoWord> {
 late WordProvider _wordProvider ;

  @override
  void didChangeDependencies() {
    _wordProvider = Provider.of<WordProvider>(context,listen: false);
  //  _wordProvider.init();
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(title: Text('Word List Page'),),
      body:  _wordProvider.wordList.isEmpty ? Center(
        child: Text('No items found'),
      ) : ListView.builder(
          itemCount: _wordProvider.wordList.length,
          itemBuilder: (context, index) {
            WordMeaningModel word = _wordProvider.wordList[index];
            return ListTile(
              title: Text(word.englishWord!,style: TextStyle(fontSize: 20),),


            );
              /*Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 8,


                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      //color: Colors.brown
                    ),


                    child: Row(

                      children: [
                        Padding(padding: const EdgeInsets.only(left: 20),
                          child: Text(word.englishWord!,style: TextStyle(fontSize: 20),),
                        ),
                        SizedBox(width: 18,),
                        Text("="),
                        SizedBox(width: 18,),
                        Text(word.banglaMeaning!,style: TextStyle(fontSize: 20)),
                        SizedBox(width: 100,),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.delete))

                      ],
                    ),

                  ),
                ),
            );*/



          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, InsertWord.routeName);
        },

      ),



    );


  }
}

