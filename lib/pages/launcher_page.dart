

import 'package:english_spoken_rules_admin/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../auth/firebase_auth_service.dart';
import 'login_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher_page';

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState()  {
    Future.delayed(Duration.zero,(){
      if(FirebaseAuthService.currentUser!=null){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
      else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }

    });

   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Launcher Page'),),
    );
  }


}
