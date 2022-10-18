
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
    _wordProvider = Provider.of<WordProvider>(context,listen: true);
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
            return
              Stack(
                children: [
                   Container(
                      height: 50,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                           children: [
                             Text(word.englishWord!,style: TextStyle(fontSize: 20),),
                             SizedBox(width: 10,),
                             Text('='),
                             SizedBox(width: 10,),
                             Text(word.banglaMeaning!,style: TextStyle(fontSize: 20)),

                           ],

                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    top: 0.5,
                    bottom: 10,
                    right: 20,
                    child: IconButton(
                           onPressed: (){
                             _wordProvider.removeFromCart2(word);
                           },
                        icon: Icon(Icons.delete)),
                      )



                ],
            );

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


