import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  // static Future<User?> handleAuthState() {}

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final dbReference = FirebaseDatabase.instance.ref();
    User? user;

    final GoogleSignIn gSignIn = GoogleSignIn();

    final GoogleSignInAccount? gSignAccount = await gSignIn.signIn();

    if (gSignAccount != null) {
      final GoogleSignInAuthentication gSignAuth =
          await gSignAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gSignAuth.accessToken,
        idToken: gSignAuth.idToken,
      );
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        dbReference.child(auth.currentUser!.uid).set({
          'nama': auth.currentUser!.displayName,
          'email': auth.currentUser!.email,
          'no_hp': '-',
          'login_type': 'google_signin'
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('test1'),
            duration: Duration(seconds: 2),
          ));
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Gagal pada saat mengakses akun, coba lagi!'),
            duration: Duration(seconds: 2),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal terhubung dengan akun Google, coba lagi!'),
          duration: Duration(seconds: 2),
        ));
      }
      return user;
    }
  }

  // static Future<List> fetchFirebaseData() async {
  //   final dbRef = FirebaseDatabase.instance.ref();
  //   final auth = FirebaseAuth.instance;
  //   final currentUser = auth.currentUser!.uid;

  // try {
  //   final response = await dbRef.child(currentUser).once();
  //   List<dynamic> value;
  //   Map<dynamic, dynamic> finalValue = response.snapshot.value;
  //   log(response.toString());

  // } catch (e) {
  //   print(e);
  //   throw e;
  // }
  // }
}
