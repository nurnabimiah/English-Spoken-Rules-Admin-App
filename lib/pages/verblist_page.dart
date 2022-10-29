import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:english_spoken_rules_admin/models/verb_model.dart';
import 'package:english_spoken_rules_admin/pages/verb_insert_page.dart';
import 'package:english_spoken_rules_admin/providers/verb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerbListPage extends StatefulWidget {
  static const String routeName = "/ verb_list_page";



  @override
  State<VerbListPage> createState() => _VerbListPageState();
}

class _VerbListPageState extends State<VerbListPage> {
  ScrollController _controller = new ScrollController();
  late VerbProvider _verbProvider;
  bool _isInit = true;


  @override
  void didChangeDependencies() {
    _verbProvider = Provider.of<VerbProvider>(context,listen: true);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Verb List'),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              child: Table(

                columnWidths: {
                  0:FractionColumnWidth(0.37),
                  1:FractionColumnWidth(0.31),
                  2:FractionColumnWidth(0.32),
                },
                border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                children: [
                  TableRow(
                      children: [
                        TableCell(child: Center(
                          child: Text('Present Form',style: TextStyle(fontSize: 18.0)),
                        )),

                        TableCell(child: Center(
                          child: Text('Past Form',style: TextStyle(fontSize: 18.0)),
                        )),

                        TableCell(child: Center(
                          child: Text('Past Participle Form',style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,),
                        ))
                      ]
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child:
                _verbProvider.verbList.isEmpty? Center(child: Text('You have no insert to data'),):

                /*
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _verbProvider.verbList.length,
                      itemBuilder: (context,index){
                        VerbModel verbs = _verbProvider.verbList[index];
                        */
                       ListView(
                         shrinkWrap: true,
                         children: _verbProvider.verbList.map((verbs){
                           return Table(
                             //defaultColumnWidth: FixedColumnWidth(120.0),
                               columnWidths: {
                                 0:FractionColumnWidth(0.37),
                                 1:FractionColumnWidth(0.31),
                                 2:FractionColumnWidth(0.32),
                               },
                               border: TableBorder.all(
                                 color: Colors.deepOrange,
                                 style: BorderStyle.solid,
                                 width: 1.00,
                               ),

                               children: [
                                 TableRow(
                                     children: [
                                       /*TableCell(child: Container(
                                     //color: Colors.greenAccent,
                                     child: Center(
                                       child: Text(verbs.presentForm!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                     ) ,
                                   ))*/

                                       TableCell(child: Container(
                                         child: Column(
                                           children: [
                                             Text(verbs.presentForm!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                             Text(verbs.banglaMeaning!)
                                             ,
                                           ],

                                         ),
                                       )),

                                       TableCell(child: Column(
                                         children: [
                                           Text(verbs.pastFrom!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                           IconButton(
                                               onPressed:(){
                                                 showDialog(
                                                     context: context,
                                                     builder: (context) => AlertDialog(
                                                       title: const Text('Delete Word'),
                                                       content: const Text(' Are You Sure to Delete this verb'),
                                                       actions: [
                                                         TextButton( child: const Text('CANCEL'),
                                                           onPressed: (){
                                                             Navigator.pop(context,false);

                                                           },
                                                         ),

                                                         ElevatedButton(
                                                           child: const Text('YES'),
                                                           onPressed: (){
                                                             _verbProvider.removeFromVerbList(verbs);
                                                             Navigator.pop(context,true);
                                                           },
                                                         ),
                                                       ],
                                                     )

                                                 );
                                               },

                                               icon: Icon(Icons.delete,size: 22,))

                                         ],

                                       )),


                                       TableCell(child: Column(
                                         children: [
                                           Text(verbs.pastParticipleForm!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                           IconButton(
                                               onPressed: (){},
                                               icon: Icon(Icons.edit,size: 22,))
                                           ,
                                         ],

                                       )),

                                     ]
                                 ),

                               ]

                           );
                         }).toList(),

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
          Navigator.pushNamed(context, VerbInsert.routeName);
        },

      ),
    );
  }
}
