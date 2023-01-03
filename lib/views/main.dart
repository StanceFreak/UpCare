import 'package:emr_mobile/views/BottomNav.dart';
import 'package:emr_mobile/views/HomePage.dart';
import 'package:emr_mobile/views/LandingPage.dart';
import 'package:emr_mobile/views/MedicineCategoriesPage.dart';
import 'package:emr_mobile/views/PendaftaranSuksesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? startPage;

    if (FirebaseAuth.instance.currentUser == null) {
      startPage = '/';
    } else {
      startPage = '/navigation';
    }
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Your app name',
            initialRoute: startPage,
            routes: {
              '/': (context) => LandingPage(),
              '/navigation': (BuildContext context) => BottomNav(),
              '/pendaftaranSukses': (BuildContext context) =>
                  PendaftaranSuksesPage()
              // '/medicineCategoriesPage': (context) => MedicineCategoriesPage(),
            },
          );
        });
  }
}
