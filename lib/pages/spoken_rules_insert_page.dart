import 'package:english_spoken_rules_admin/models/spoken_rules_model.dart';
import 'package:english_spoken_rules_admin/pages/rename_word.dart';
import 'package:english_spoken_rules_admin/pages/ruleslist_page.dart';
import 'package:english_spoken_rules_admin/providers/spoken_rules_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpokenRules extends StatefulWidget {
  static const String routeName = '/spoken_rules';

  @override
  State<SpokenRules> createState() => _SpokenRulesState();
}

class _SpokenRulesState extends State<SpokenRules> {
  final _formkey = GlobalKey<FormState>();
  late SpokenRulesProvider _spokenRulesProvider;

  final _rulesNumberController = TextEditingController();
  final _rulesController = TextEditingController();
  final _stractureController = TextEditingController();
  final _banExampleController1 = TextEditingController();
  final _englishExampleController1 = TextEditingController();
  final _banExampleController2 = TextEditingController();
  final _englishExampleController2 = TextEditingController();
  final _banExampleController3 = TextEditingController();
  final _englishExampleController3 = TextEditingController();
  final _banExampleController4 = TextEditingController();
  final _englishExampleController4 = TextEditingController();
  final _banExampleController5 = TextEditingController();
  final _englishExampleController5 = TextEditingController();

  bool _isInit = true;


  @override
  void didChangeDependencies() {
    if (_isInit){
      _spokenRulesProvider = Provider.of<SpokenRulesProvider>(context,listen: true);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _rulesNumberController.dispose();
    _rulesController.dispose();
    _stractureController.dispose();
    _banExampleController1.dispose();
    _englishExampleController1.dispose();

    _banExampleController2.dispose();
    _englishExampleController2.dispose();

    _banExampleController3.dispose();
    _englishExampleController3.dispose();

    _banExampleController4.dispose();
    _englishExampleController4.dispose();

    _banExampleController5.dispose();
    _englishExampleController5.dispose();
    super.dispose();
  } // controller declaration




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spoken Rules Page'),
        actions: [
          IconButton(
              onPressed: _saveRules,
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: _rulesNumberController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Rules Number',
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
             //.........one No. example.................
             SizedBox(height: 10,),
              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _rulesController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Rules',
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
                controller:  _stractureController,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Structure',
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
                controller: _banExampleController1,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Example 1',
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
                controller: _englishExampleController1,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'English Example 1',
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

              //.........two example.................


              SizedBox(height: 10,),
              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _banExampleController2,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Example 2',
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
                controller: _englishExampleController2,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'English Example 2',
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

             //.........three no. example.................


              SizedBox(height: 10,),
              TextFormField(/*joto gola filed thakbe totho gola controller banaite hobe*/
                controller: _banExampleController3,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Example 3',
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
                controller: _englishExampleController3,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'English Example 3',
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



              //.........fourth no. example.................

            /*  SizedBox(height: 10,),
              TextFormField(*//*joto gola filed thakbe totho gola controller banaite hobe*//*
                controller: _banExampleController4,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Example 4',
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
              TextFormField(*//*joto gola filed thakbe totho gola controller banaite hobe*//*
                controller: _englishExampleController4,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'English Example 4',
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

              //.........Fifith no. example.................

              SizedBox(height: 10,),
              TextFormField(*//*joto gola filed thakbe totho gola controller banaite hobe*//*
                controller: _banExampleController5,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'Bangla Example 5',
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
              TextFormField(*//*joto gola filed thakbe totho gola controller banaite hobe*//*
                controller: _englishExampleController5,
                // controller diye value golo newa hoy
                decoration: InputDecoration(
                  labelText: 'English Example 5',
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


              ),*/

            ],
          ),
        ),

      ),

    );
  }

  void _saveRules() {
    if(_formkey.currentState!.validate()){
      final rules = SpokenRulesModel(
        rulesNumber: int.parse(_rulesNumberController.text),
        rules: _rulesController.text,
        structure: _stractureController.text,
        banglaExample1: _banExampleController1.text,
        englishExample1: _englishExampleController1.text,

        banglaExample2: _banExampleController2.text,
        englishExample2: _englishExampleController2.text,

        banglaExample3: _banExampleController3.text,
        englishExample3: _englishExampleController3.text,

       /* banglaExample4: _banExampleController4.text,
        englishExample4: _englishExampleController4.text,
        banglaExample5: _banExampleController5.text,
        englishExample5: _englishExampleController5.text,*/

      );

      _spokenRulesProvider.insertNewRules(rules).then((value) =>

          Navigator.pushNamed(context, RulesListPage.routeName)
      );



    }

  }

}
