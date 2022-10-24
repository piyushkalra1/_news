
import 'package:email_verfiy/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_verfiy/user/dashboard.dart';
import 'package:email_verfiy/user/profile.dart';
import 'package:email_verfiy/user/change_password.dart';


class UserMain extends StatefulWidget {
  UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Profile(),
    ChangePassword(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome User"),
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (context)=>Login()));
            },
                child: Text("logout"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent))

          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Change Password',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
