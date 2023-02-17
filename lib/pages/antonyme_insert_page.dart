
import 'package:english_spoken_rules_admin/models/antonyme_model.dart';
import 'package:english_spoken_rules_admin/pages/antonyme_list_page.dart';
import 'package:english_spoken_rules_admin/providers/antonym_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AntonymeInsertPage extends StatefulWidget {
  //const AntonymeInsertPage({Key? key}) : super(key: key);
  static const String routeName = '/antonytm_insert_page';

  @override
  State<AntonymeInsertPage> createState() => _AntonymeInsertPageState();
}

class _AntonymeInsertPageState extends State<AntonymeInsertPage> {
  final _formkey = GlobalKey<FormState>();
  bool _isInit = true;
  late AntonymProvider _antonymProvider;

  final _mainwordController = TextEditingController();
  final _banglaMeaningController = TextEditingController();
  final _antonymsController = TextEditingController();


  @override
  void didChangeDependencies() {
    if(_isInit){
      _antonymProvider = Provider.of<AntonymProvider>(context);
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _mainwordController.dispose();
    _banglaMeaningController.dispose();
    _antonymsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Antonyme insert page'  ),
        actions: [
          IconButton(
              onPressed:_saveData,
              icon: Icon(Icons.save))
        ],
      ),

      body:Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // ...............................present form...............
              TextFormField(
                controller: _mainwordController,
                decoration: InputDecoration(
                  labelText: 'Main Word',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),


                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This filed must not be empty';
                  }

                  return null; // jodi user kiso type kre thake
                },


              ),
              SizedBox(height: 10,),





              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _banglaMeaningController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Meaning',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),


                ),
                maxLines: 5,
                minLines: 1,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This filed must not be empty';
                  }

                  return null; // jodi user kiso type kre thake
                },


              ),
              SizedBox(height: 10,),




              TextFormField(
                controller: _antonymsController,

                decoration: InputDecoration(
                  labelText: 'Antonyms',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),


                ),
                maxLines: 5,
                minLines: 1,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This filed must not be empty';
                  }

                  return null; // jodi user kiso type kre thake
                },

              ),




            ],
          ),
        ),

      ),
    );

}
  void _saveData() {
    final insertAntonym = AntonymeModel(

      mainword: _mainwordController.text,
      banglaMeaning: _banglaMeaningController.text,
      antonym: _antonymsController.text,

    );

    _antonymProvider.insertNewSynonym(insertAntonym).then((value) =>

        Navigator.pushNamed(context,AntonymeListPage.routeName)
    );


  }
  }

