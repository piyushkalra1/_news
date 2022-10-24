

import 'package:email_verfiy/news.dart';
import 'package:email_verfiy/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forget_password.dart';
import 'home.dart';
import 'topbutton.dart';



class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => News(),
          ),
        );
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              // style: kShowstyle,
            ),
          ),
        );
        if (e.code == 'wrong-password') {
          print("Wrong Password Provided by User");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Wrong Password Provided by User",
                // style: kShowstyle,
              ),
            ),
          );
        }}
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  final selectedIndexNotifier = ValueNotifier<int?>(1);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        bottomNavigationBar: FlatButton(
          focusColor: Colors.red,
          minWidth: MediaQuery.of(context).size.width,
          height: 55,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),

          child: Text(' Login', style: TextStyle(fontSize: 24,color: Colors.white)),
          onPressed: (){
            if(_formKey.currentState!.validate()){
              setState(() {
                email=emailController.text;
                password =passwordController.text;

              });
              userLogin();
            }
          },
          color: Colors.red,
          textColor: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,

        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text('Social'),
              Text('X'),
            ],
          ),
        ),


        body:SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  color: Colors.red,


                  child: ValueListenableBuilder<int?>(

                      valueListenable: selectedIndexNotifier,
                      builder: (_, selectedIndex, __) => Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyWidget(
                              key: ValueKey(1),
                              text: "Login",
                              isFavorite: selectedIndex == 1,
                              onPressed: (){
                                selectedIndex == 1 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 1;
                                setState(() {


                                });
                              }
                          ),
                          MyWidget(
                              key: ValueKey(2),
                              text: " Sign Up",

                              isFavorite: selectedIndex == 2,
                              onPressed: () { selectedIndex == 2 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 2;
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                              });
                              }
                          ),

                        ],
                      ))),
              Container(

                // padding:EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.70,


                child:Card(

                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),


                  // color: Colors.purple[300],
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text('SignIn into your Project',style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),),

                      ),
                      Column(

                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(margin: EdgeInsets.only(left: 20),
                                child:  Text('Email'),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),



                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                SizedBox(height: 10,),
                                Expanded(child: TextFormField(
                                  autofocus: false,
                                  onChanged: (value){

                                  },

                                  decoration: const InputDecoration(
                                      hintText: 'johndoe@gmail.com',
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      )
                                  ),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    } else if (!value.contains('@')) {
                                      return 'Please Enter Valid Email';
                                    }
                                    return null;
                                  },
                                ),
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.email_outlined,color: Colors.black38,),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Container(margin: EdgeInsets.only(left: 20),
                                child:  Text('Password'),),
                            ],
                          ),
                          SizedBox(height: 10,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),

                            child: Row(
                              children: [


                                SizedBox(width: 12,),

                                Expanded(child: TextFormField(
                                  autofocus: false,
                                  obscureText: true,

                                  onChanged: (value){

                                  },

                                  decoration: const InputDecoration(
                                    hintText: 'Password',

                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },

                                ),
                                ),
                                Icon(Icons.lock),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Spacer(),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                              },
                                child:Text('Forgot Password ?',style: TextStyle(fontWeight: FontWeight.bold),),

                              )
                            ],
                          ),
                          Text('Login With' ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,width: 40,
                                child: const Image(
                                  image: AssetImage('images/g.jpg'),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                height: 40,width: 40,
                                child: Image(
                                  image: AssetImage('images/f.jpg'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(onPressed: (){}, child: Text('Register Now',style: TextStyle(color: Colors.red),)),

                            ],
                          ),



                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
