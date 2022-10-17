
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:english_spoken_rules_admin/pages/spoken_rules_page.dart';
import 'package:english_spoken_rules_admin/pages/tense_page.dart';
import 'package:english_spoken_rules_admin/pages/verb_page.dart';
import 'package:english_spoken_rules_admin/pages/word_meaning_page.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/dashboard_button.dart';

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
      appBar: AppBar(title: Text('Home Page'),),
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
            onPressed: () => Navigator.pushNamed(context, SpokenRules.routeName),
          ),
          DashboardButton(
            label: 'Verb',
            onPressed: () => Navigator.pushNamed(context, VerbPage.routeName),
          ),
        ],
      ),
    );
  }
}
