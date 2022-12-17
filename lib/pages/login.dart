

import 'package:email_verfiy/news.dart';
import 'package:email_verfiy/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../const/image_slider.dart';
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
  FocusNode emailFocusNode =FocusNode();
  FocusNode passwordFocusNode =FocusNode();



  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);



  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageSlider(),
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
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
    super.dispose();
  }
  final selectedIndexNotifier = ValueNotifier<int?>(1);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(

        bottomNavigationBar:InkWell(
          onTap: (){
            if(_formKey.currentState!.validate()){
              setState(() {
                email=emailController.text;
                password =passwordController.text;

              });
              userLogin();
            }
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow.shade800,

            ),child: Center(
            child: Text('REGISTER',style: TextStyle(fontSize: 25,color: Colors.white),),
          ),

          ),
        ),
        // FloatingActionButton(
        //
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        //
        //   child: Text(' Login', style: TextStyle(fontSize: 24,color: Colors.white)),
        //   onPressed: (){
        //     if(_formKey.currentState!.validate()){
        //       setState(() {
        //         email=emailController.text;
        //         password =passwordController.text;
        //
        //       });
        //       userLogin();
        //     }
        //   },
        //   // color: Colors.red,
        //   // textColor: Colors.white,
        // ),
        backgroundColor: Colors.white,

        body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Card(
                //     color: Colors.red,
                //
                //
                //     child: ValueListenableBuilder<int?>(
                //
                //         valueListenable: selectedIndexNotifier,
                //         builder: (_, selectedIndex, __) => Row(
                //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             MyWidget(
                //                 key: ValueKey(1),
                //                 text: "Login",
                //                 isFavorite: selectedIndex == 1,
                //                 onPressed: (){
                //                   selectedIndex == 1 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 1;
                //                   setState(() {
                //
                //
                //                   });
                //                 }
                //             ),
                //             MyWidget(
                //                 key: ValueKey(2),
                //                 text: " Sign Up",
                //
                //                 isFavorite: selectedIndex == 2,
                //                 onPressed: () { selectedIndex == 2 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 2;
                //                 setState(() {
                //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                //                 });
                //                 }
                //             ),
                //
                //           ],
                //         ))),
                Container(

                  // padding:EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.all(20),
                  child:ListView(
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Log in to get started',style:  TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w300),),
                          SizedBox(height: 20,),
                          Text('Experience the all new App!',style:  TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w300),),

                          SizedBox(height: 10,),

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
                                    labelText: 'E-mail Id',
                                    prefixIcon: Icon(Icons.mail),
                                  ),

                                  controller: emailController,
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'please enter name';
                                    }
                                    else if (!value.contains('@')){
                                      return 'Please enter valid email';
                                    }
                                    return null;
                                  },


                                ),
                                ),


                                SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),


                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),

                            child: Row(
                              children: [



                                Expanded(child: ValueListenableBuilder(valueListenable: _obscurePassword,
                                builder: (context,value,child){
                                  return TextFormField(

                                    focusNode: passwordFocusNode,

                                    obscureText: _obscurePassword.value,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: InkWell(
                                          onTap: (){
                                            _obscurePassword.value =! _obscurePassword.value;
                                          },
                                          child: _obscurePassword.value ? Icon(Icons.visibility_off_outlined):
                                          Icon(Icons.visibility),
                                        )

                                    ),
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Password';
                                      }
                                      return null;
                                    },
                                  );

                                }
                                )


                                ),
                                // Icon(Icons.lock),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Spacer(),
                              TextButton(onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                              },
                                child:Text('Use Mobile Number',style: TextStyle(fontWeight: FontWeight.w400,
                                color: Colors.yellow.shade800),),

                              )
                            ],
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                              }, child: Text('Sign Up Now',style: TextStyle(color: Colors.red),)),

                            ],
                          ),




                        ],
                      ),
                    ],
                  ),
                ),

                Text('hii',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
