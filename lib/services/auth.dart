import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatapp/models/Deuser.dart';


class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Deuser _userFromFirebaseUser(User user){
    return user !=null ? Deuser(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async{

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async{

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword
        (email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }
  Future resetPass(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){

    }
  }
}



