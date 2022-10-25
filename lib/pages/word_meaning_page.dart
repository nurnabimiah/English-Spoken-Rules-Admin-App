
import 'package:english_spoken_rules_admin/pages/insert_word.dart';
import 'package:english_spoken_rules_admin/pages/rename_word.dart';
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
    var screen_height = MediaQuery.of(context).size.height;
    var container_height =  MediaQuery.of(context).size.height/13;

    var screen_width = MediaQuery.of(context).size.width;
    var container_width =  MediaQuery.of(context).size.width/0.5;


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
                      height: container_height,
                      width: container_width,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                           children: [
                             Text(word.englishWord!,style: TextStyle(fontSize: 20),maxLines: 2,),
                             SizedBox(width: 10,),
                             Text('='),
                             SizedBox(width: 10,),
                             Text(word.banglaMeaning!,style: TextStyle(fontSize: 20),maxLines: 2,),

                           ],

                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    top: 0.5,
                    bottom: 10,
                    right: 0.5,
                    child: IconButton(
                           onPressed: (){
                             showDialog(
                                 context: context,
                                 builder: (context) => AlertDialog(
                                   title: const Text('Delete Word'),
                                   content: const Text('Sure to Delete this contact'),
                                   actions: [
                                     TextButton( child: const Text('CANCEL'),
                                       onPressed: (){
                                         Navigator.pop(context,false);

                                       },
                                     ),

                                     ElevatedButton(
                                       child: const Text('YES'),
                                       onPressed: (){
                                         _wordProvider.removeFromWord(word);
                                         Navigator.pop(context,true);
                                       },
                                     ),
                                   ],
                                 )

                             );
                           },
                        icon: Icon(Icons.delete)),
                      ),


                  Positioned(
                    top: 0.5,
                    bottom: 10,
                    right: 30,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        //_wordProvider.updateFromWord(word);
                        //Navigator.pushNamed(context, InsertWord.routeName,arguments: word.wordId);
                        Navigator.pushReplacementNamed(context, InsertWord.routeName,arguments: word.wordId);
                      },
                    ),
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


