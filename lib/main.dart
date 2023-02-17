
import 'package:english_spoken_rules_admin/pages/antonyme_insert_page.dart';
import 'package:english_spoken_rules_admin/pages/antonyme_list_page.dart';
import 'package:english_spoken_rules_admin/pages/home_page.dart';
import 'package:english_spoken_rules_admin/pages/insert_word.dart';
import 'package:english_spoken_rules_admin/pages/launcher_page.dart';
import 'package:english_spoken_rules_admin/pages/login_page.dart';
import 'package:english_spoken_rules_admin/pages/rename_word.dart';
import 'package:english_spoken_rules_admin/pages/ruleslist_page.dart';
import 'package:english_spoken_rules_admin/pages/spoken_rules_insert_page.dart';
import 'package:english_spoken_rules_admin/pages/synoname_insert_page.dart';
import 'package:english_spoken_rules_admin/pages/synoname_list_page.dart';
import 'package:english_spoken_rules_admin/pages/tense_page.dart';
import 'package:english_spoken_rules_admin/pages/verb_insert_page.dart';
import 'package:english_spoken_rules_admin/pages/verblist_page.dart';
import 'package:english_spoken_rules_admin/pages/word_meaning_page.dart';
import 'package:english_spoken_rules_admin/providers/antonym_provider.dart';
import 'package:english_spoken_rules_admin/providers/spoken_rules_provider.dart';
import 'package:english_spoken_rules_admin/providers/synoname_provider.dart';
import 'package:english_spoken_rules_admin/providers/tense_provider.dart';
import 'package:english_spoken_rules_admin/providers/verb_provider.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SpokenRulesProvider()..getALlRules()),
        ChangeNotifierProvider(create: (context) => VerbProvider()..getALlVerbs()),
        ChangeNotifierProvider(create: (context) => TenseProvider()),
        ChangeNotifierProvider(create: (context) => WordProvider()),
        ChangeNotifierProvider(create: (context) => SynonameProvider()..getSynonyms()),
        ChangeNotifierProvider(create: (context) => AntonymProvider()..getAntonyms()),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: LauncherPage(),
      routes: {
        HomePage.routeName:(context) => HomePage(),
        SpokenRules.routeName:(context) => SpokenRules(),
        TensePage.routeName:(context) => TensePage(),
        VerbListPage.routeName:(context) => VerbListPage(),
        VerbInsert.routeName:(context) => VerbInsert(),
        AddtoWord.routeName:(context) => AddtoWord(),
        InsertWord.routeName:(context) => InsertWord(),
        RenameWord.routeName:(context) => RenameWord(),
        RulesListPage.routeName:(context) => RulesListPage(),
        SynonameListPage.routeName:(context) => SynonameListPage(),
        SynonameInsertPage.routeName:(context) => SynonameInsertPage(),
        AntonymeListPage.routeName:(context) => AntonymeListPage(),
        AntonymeInsertPage.routeName:(context) => AntonymeInsertPage(),
        LauncherPage.routeName:(context) => LauncherPage(),
        LoginPage.routeName:(context) => LoginPage(),


      },
    );
  }
}


