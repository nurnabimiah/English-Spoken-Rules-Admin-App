import 'package:english_spoken_rules_admin/models/verb_model.dart';
import 'package:english_spoken_rules_admin/pages/verblist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/verb_provider.dart';

class VerbInsert extends StatefulWidget {
  static const String routeName = '/ insert_new_verb';

  @override
  State<VerbInsert> createState() => _VerbInsertState();
}

class _VerbInsertState extends State<VerbInsert> {
  final _formkey = GlobalKey<FormState>();
  final _presentFormController = TextEditingController();
  final _banglaMeaningController = TextEditingController();
  final _pastFormController = TextEditingController();
  final _pastParticipleFormController = TextEditingController();
  final _verbCategoryController  = TextEditingController();

  String? _verbCategory;
  bool _isInit = true;

  late VerbProvider _verbProvider;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _verbProvider = Provider.of<VerbProvider>(context);
      _verbProvider.init().then((value) {
        _isInit = false;
      });
    }

    // print("1 insert...............................................}");

    super.didChangeDependencies();
  }



  @override
  void dispose() {
    _presentFormController.dispose();
    _banglaMeaningController.dispose();
    _pastFormController.dispose();
    _pastParticipleFormController.dispose();
    _verbCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Insert New Verb'),
        actions: [
          IconButton(onPressed: _saveVerb,
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
                controller: _presentFormController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Present Form',
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
              //.........bangle meaning controller.................
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
              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _pastFormController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Past Form',
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
              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _pastParticipleFormController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Past Participle Form',
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

              DropdownButtonFormField<String>(


                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),

                hint: Text('Select Category'),
                value: _verbCategory,
                onChanged: (value) {
                  setState(() {
                    _verbCategory = value;
                  });
                },
                /*onSaved: (value) {
                  _wordMeaningModel.category = value;
                },*/
                items: _verbProvider.verbCategoryList.map((cat) =>
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

      ),
    );
  }

  void _saveVerb() {
    if(_formkey.currentState!.validate()){
      final insertVerb = VerbModel(

        presentForm: _presentFormController.text,
        banglaMeaning: _banglaMeaningController.text,
        pastFrom: _pastFormController.text,
        pastParticipleForm: _pastParticipleFormController.text,
        verbCategory: _verbCategoryController.text,

      );

      _verbProvider.insertNewVerb(insertVerb).then((value) =>

          Navigator.pushNamed(context, VerbListPage.routeName)
      );



    }
  }
}
