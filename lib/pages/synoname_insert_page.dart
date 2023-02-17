
import 'package:english_spoken_rules_admin/models/synoname_model.dart';
import 'package:english_spoken_rules_admin/pages/synoname_list_page.dart';
import 'package:english_spoken_rules_admin/providers/synoname_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SynonameInsertPage extends StatefulWidget {
  //const SynonameInsertPage({Key? key}) : super(key: key);
  static const String routeName = ' /synoname_insert_page';

  @override
  State<SynonameInsertPage> createState() => _SynonameInsertPageState();
}

class _SynonameInsertPageState extends State<SynonameInsertPage> {

  final _formkey = GlobalKey<FormState>();
  bool _isInit = true;
  late SynonameProvider _synonameProvider;

  final _wordController = TextEditingController();
  final _banglaMeaningController = TextEditingController();
  final _synonameController = TextEditingController();


  @override
  void didChangeDependencies() {
    if(_isInit){
      _synonameProvider = Provider.of<SynonameProvider>(context);
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _wordController.dispose();
    _banglaMeaningController.dispose();
    _synonameController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Synoname insert page '),
          actions: [
            IconButton(
                onPressed:_save,
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
                controller: _wordController,
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
                controller: _synonameController,

                decoration: InputDecoration(
                  labelText: 'Synoname',
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

  void _save() {
    if(_formkey.currentState!.validate()){
      final insertSynoname = SynonameModel(

        word: _wordController.text,
        banglaMeaning: _banglaMeaningController.text,
        synoname: _synonameController.text,

      );

      _synonameProvider.insertNewSynonym(insertSynoname).then((value) =>

          Navigator.pushNamed(context,SynonameListPage.routeName)
      );



    }
  }

}
