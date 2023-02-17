
import 'dart:ffi';

import 'package:english_spoken_rules_admin/pages/home_page.dart';
import 'package:english_spoken_rules_admin/providers/login_provider.dart';
import 'package:english_spoken_rules_admin/providers/synoname_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth_service.dart';


class LoginPage extends StatefulWidget {
  static const String routeName = '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String errMsg = '';
  late SynonameProvider _loginProvider;

  @override
  void didChangeDependencies() {
    _loginProvider = Provider.of<SynonameProvider>(context,listen: false);
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(

                    child: Text('Admin Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red),)),

                SizedBox(height: 18,),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'This filed must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value){
                    _email = value;
                  },


                ),

                const SizedBox(height: 10,),



                TextFormField(
                  obscureText: true,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'This filed must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),

                  onSaved: (value){
                    _password = value;
                  },


                ),

                SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                      onPressed:_loginAdmin,
                      child: Text('Login')),
                ),
                SizedBox(height: 20,),
                Center(child: Text(errMsg,style: const TextStyle(fontSize: 16),)),


              ],
            ),
          ),
        ),
      ),

    );
  }

  void _loginAdmin() async{
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      try{
        final user = await FirebaseAuthService.loginAdmin(_email!, _password!);
        if(user!=null){
          final status = await _loginProvider.cheackAdmin(_email!);
          if(status){
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }
          else{
            FirebaseAuthService.logOutAdmin();
            setState((){
              errMsg = 'You are not an admin';

            });
          }
        }


      } on FirebaseAuthException catch(e){
        setState((){
          errMsg = e.message!;

        });
      }
    }

  }
}
