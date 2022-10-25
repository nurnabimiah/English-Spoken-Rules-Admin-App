
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:english_spoken_rules_admin/providers/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RenameWord extends StatefulWidget {
  static const String routeName = '/rename_word';

  @override
  State<RenameWord> createState() => _RenameWordState();
}

class _RenameWordState extends State<RenameWord> {
  WordMeaningModel wordMeaningModel = new WordMeaningModel();
  late  WordProvider _wordProvider;
  @override
  void didChangeDependencies() {
    _wordProvider = Provider.of<WordProvider>(context,listen: true);
      _wordProvider.init();
    super.didChangeDependencies();
  }

  /*@override
  void initState() {
    _wordProvider = Provider.of<WordProvider>(context,listen: true);
    _wordProvider.
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rename Word'),),
      body: ListView(
        children: [

        ],

      ),
    );
  }
}
