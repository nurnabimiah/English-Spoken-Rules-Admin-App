

import 'package:english_spoken_rules_admin/db/firestore_helper.dart';
import 'package:flutter/material.dart';

class TenseProvider extends ChangeNotifier{

  Future<bool> cheackAdmin(String email){
    return DbHelper.checkAdmin(email);
  }
}