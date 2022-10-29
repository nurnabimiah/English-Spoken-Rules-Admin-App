
import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:english_spoken_rules_admin/pages/spoken_rules_insert_page.dart';
import 'package:english_spoken_rules_admin/providers/spoken_rules_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesListPage extends StatefulWidget {
  static const String routeName = '/rules_list';

  //const RulesListPage({Key? key}) : super(key: key);

  @override
  State<RulesListPage> createState() => _RulesListPageState();
}

class _RulesListPageState extends State<RulesListPage> {


  late SpokenRulesProvider _spokenRulesProvider;



  @override
  void didChangeDependencies() {
    _spokenRulesProvider = Provider.of<SpokenRulesProvider>(context,listen: true);

    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var container_height =  MediaQuery.of(context).size.height/13;

    var screen_width = MediaQuery.of(context).size.width;
    var container_width =  MediaQuery.of(context).size.width/10;

    return Scaffold(
      appBar: AppBar(title: Text('Rules List '),),
      body: _spokenRulesProvider.rulesdList.isEmpty ? Center(child: Text('You have no data insert data'),
      ):ListView.builder(

          itemCount: _spokenRulesProvider.rulesdList.length,
          itemBuilder: (context,index){
            SpokenRulesModel rules = _spokenRulesProvider.rulesdList[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: container_width,
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: const Color(0xff764abc),
                          //child: Text("${index+1}"),
                           child: (Text("${index+1}"))
                          ),
                         title: Text(rules.rules!),
                    ),
                    ListTile(
                      title: Text(rules.banglaExample1!),
                      subtitle: Text(rules.englishExample1!),
                    ),

                    ListTile(
                      title: Text(rules.banglaExample2!),
                      subtitle: Text(rules.englishExample2!),
                    ),

                    ListTile(
                      title: Text(rules.banglaExample3!),
                      subtitle: Text(rules.englishExample3!),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                       icon: Icon(Icons.delete,color: Colors.red,size: 30,),

                            onPressed:(){
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
                                      _spokenRulesProvider.removeFromRules(rules);
                                      Navigator.pop(context,true);
                                    },
                                  ),
                                ],
                              )

                          );
                        },
                            ),



                        IconButton(
                            icon: Icon(Icons.edit,color: Colors.red,size: 30,),
                          onPressed: (){
                              Navigator.pushReplacementNamed(context, SpokenRules.routeName,arguments: rules.id);
                          }
                          ,
                        ),



                      ],
                    )

                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black12
                ),


              ),
            );
        }
      ),

      floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () {
    Navigator.pushNamed(context, SpokenRules.routeName);
    },
    ),
    );
  }
}
