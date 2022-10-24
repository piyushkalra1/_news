import 'package:email_verfiy/pages/login.dart';
import 'package:email_verfiy/const/quotes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp>_initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("something not ok");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.blue,
            ),
            home: Login(),
          );
        });
  }
}
