

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance; // aita diye sign in korte hoy,signout korte hoy,current user k nite hoy
  static User? get currentUser => _auth.currentUser; // jodi keo login  thekhe thake
  // cheack korbo lanucher page a



  // jodi successfully login hoy tar user ta amra return kore dibo
  static Future<User?> loginAdmin(String email, String pass) async{
   final credential =  await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return credential.user;
  }

   static Future <void> logOutAdmin(){

    return _auth.signOut();
   }

}