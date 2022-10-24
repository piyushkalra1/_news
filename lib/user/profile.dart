import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid =FirebaseAuth.instance.currentUser!.uid;
  final email =FirebaseAuth.instance.currentUser!.email;
  final creationtime =
      FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user =FirebaseAuth.instance.currentUser;

  verifyEmail()async{
    if(user !=null && user!.emailVerified){
      await user!.sendEmailVerification();
      print("verification email has beem send");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'verification email has beem send',
            style: TextStyle(fontSize: 18.0,color: Colors.blue),
          ),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Text(
              'User ID: $uid',
              style: TextStyle(fontSize: 18.0),
            ),
            Row(
              children: [
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 18.0),
                ),
                user!.emailVerified
                    ? Text(
                  'verified',
                  style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                ):
                     TextButton(
                    onPressed: ()  {
                      verifyEmail();
                    },
                    child: Text('Verify Email'))
              ],
            ),
            Text(
              'Created: $creationtime',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}


