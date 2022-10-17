
import 'package:english_spoken_rules_admin/models/word_models.dart';
import 'package:flutter/material.dart';

class WordItem extends StatefulWidget {

  final WordMeaningModel wordMeaningModel;
  WordItem(this.wordMeaningModel);

  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Item'),),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(widget.wordMeaningModel.category!),
            ),
          )
        ],
      ),
    );
  }
}
