import 'package:english_spoken_rules_admin/pages/antonyme_insert_page.dart';
import 'package:english_spoken_rules_admin/providers/antonym_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/antonyme_model.dart';

class AntonymeListPage extends StatefulWidget {
  //const AntonymeListPage({Key? key}) : super(key: key);

  static const String routeName = '/antonytm_list_page';

  @override
  State<AntonymeListPage> createState() => _AntonymeListPageState();
}

class _AntonymeListPageState extends State<AntonymeListPage> {
  late AntonymProvider _antonymProvider;
  bool _isInit = true;


  @override
  void didChangeDependencies() {
    _antonymProvider = Provider.of<AntonymProvider>(context,listen: true);

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antonyms'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Table(
                columnWidths: {
                  0: FractionColumnWidth(0.40),
                  1: FractionColumnWidth(0.60),
                },
                border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Center(
                            child:Column(
                              children: [
                                Text('Main Word', style: TextStyle(fontSize: 18.0)),
                                Text('( মূল শব্দ )',style: TextStyle(fontSize: 18.0))

                              ],
                            )

                        )),
                    TableCell(
                        child: Center(
                            child: Column(
                              children: [
                                Text('Antonymes', style: TextStyle(fontSize: 18.0)),
                                Text('(বিপরীত শব্দ )',style: TextStyle(fontSize: 18.0))
                              ],
                            )
                        )),

                  ]),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: _antonymProvider.antonymList.isEmpty
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      :

                  /*
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _verbProvider.verbList.length,
                        itemBuilder: (context,index){
                          VerbModel verbs = _verbProvider.verbList[index];
                          */
                  ListView.builder(
                    itemCount: _antonymProvider.antonymList.length,
                    itemBuilder: (context,index){
                      AntonymeModel antonyms = _antonymProvider.antonymList[index];

                      return Table(
                        //defaultColumnWidth: FixedColumnWidth(120.0),
                          columnWidths: {
                            0: FractionColumnWidth(0.40),
                            1: FractionColumnWidth(0.60),
                          },
                          border: TableBorder.all(
                            color: Colors.deepOrange,
                            style: BorderStyle.solid,
                            width: 1.00,
                          ),
                          children: [
                            TableRow(children: [

                              TableCell(
                                  child: Container(
                                    child: Column(
                                      children: [

                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                  maxRadius: 13,
                                                  child: Text('${index+1}',
                                                    style: TextStyle(fontSize: 13),)),
                                            ),
                                            SizedBox(),
                                            Center(child: Text(antonyms.mainword!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),

                                          ],
                                        ),
                                        Text(antonyms.banglaMeaning!,style: TextStyle(fontSize: 15,color: Colors.purpleAccent),),
                                      ],
                                    ),
                                  )),
                              TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        antonyms.antonym!,
                                        style: TextStyle(
                                            fontSize: 18,fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                          'Delete Word'),
                                                      content: const Text(
                                                          ' Are You Sure to Delete this verb'),
                                                      actions: [
                                                        TextButton(
                                                          child: const Text(
                                                              'CANCEL'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, false);
                                                          },
                                                        ),
                                                        ElevatedButton(
                                                          child:
                                                          const Text('YES'),
                                                          onPressed: () {
                                                            _antonymProvider
                                                                .removeFromAntonymsList(
                                                                antonyms);
                                                            Navigator.pop(
                                                                context, true);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 22,
                                          ))
                                    ],
                                  )),

                            ]),
                          ]);

                    },

                    shrinkWrap: true,

                  )
                /*
                     for builder

                        })
                      */

              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AntonymeInsertPage.routeName);
        },
      ),
    );
  }
}

