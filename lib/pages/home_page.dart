

import 'package:english_spoken_rules_admin/pages/antonyme_list_page.dart';
import 'package:english_spoken_rules_admin/pages/ruleslist_page.dart';
import 'package:english_spoken_rules_admin/pages/spoken_rules_insert_page.dart';
import 'package:english_spoken_rules_admin/pages/synoname_list_page.dart';
import 'package:english_spoken_rules_admin/pages/tense_page.dart';
import 'package:english_spoken_rules_admin/pages/verblist_page.dart';
import 'package:english_spoken_rules_admin/pages/word_meaning_page.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth_service.dart';
import '../custom_widgets/dashboard_button.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {

 static const String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WordProvider _wordProvider;

  @override
  void didChangeDependencies() {
    _wordProvider = Provider.of<WordProvider>(context,listen:false);
    _wordProvider.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
        centerTitle: true,
        actions: [
         IconButton(onPressed: (){
           FirebaseAuthService.logOutAdmin().then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
         },
             icon: Icon(Icons.logout))
        ]

      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        children: [
          DashboardButton(
            label: 'Word',
            onPressed: () => Navigator.pushNamed(context, AddtoWord.routeName),
          ),
          DashboardButton(
            label: 'Tense',
            onPressed: () => Navigator.pushNamed(context, TensePage.routeName),
          ),
          DashboardButton(
            label: 'Spoken Rules',
            onPressed: () => Navigator.pushNamed(context, RulesListPage.routeName),
          ),
          DashboardButton(
            label: 'Verb',
            onPressed: () => Navigator.pushNamed(context, VerbListPage.routeName),
          ),

          DashboardButton(
            label: 'Synonyms',
            onPressed: () => Navigator.pushNamed(context, SynonameListPage.routeName),
          ),

          DashboardButton(
            label: 'Antonyme',
            onPressed: () => Navigator.pushNamed(context, AntonymeListPage.routeName),
          ),
        ],
      ),
    );
  }
}
