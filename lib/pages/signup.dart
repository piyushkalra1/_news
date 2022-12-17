//
// import 'package:email_verfiy/pages/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
// class Signup extends StatefulWidget {
//   Signup({Key? key}) : super(key: key);
//
//   @override
//   _SignupState createState() => _SignupState();
// }
//
// class _SignupState extends State<Signup> {
//   final _formKey = GlobalKey<FormState>();
//
//   var email = "";
//   var password = "";
//   var confirmPassword = "";
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   registration() async {
//     if (password == confirmPassword) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         print(userCredential);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.redAccent,
//             content: Text(
//               "Registered Successfully. Please Login..",
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Login(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           print("Password Provided is too Weak");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Password Provided is too Weak",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         } else if (e.code == 'email-already-in-use') {
//           print("Account Already exists");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Account Already exists",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         }
//       }
//     } else {
//       print("Password and Confirm Password doesn't match");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.orangeAccent,
//           content: Text(
//             "Password and Confirm Password doesn't match",
//             style: TextStyle(fontSize: 16.0, color: Colors.black),
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       body:Form(
//
//         key: _formKey,
//         child: Container(
//
//           // padding:EdgeInsets.all(10),
//           width: MediaQuery.of(context).size.width,
//           child:Stack(
//             children: <Widget>[
//               Positioned(
//
//                 height:400,
//                 width:MediaQuery.of(context).size.width,
//                 child:Image(image: AssetImage('images/3.png'),),
//               ),
//
//               Positioned(
//                 top: 250,
//                 left: 40,
//                 width: 300,
//                 height: MediaQuery.of(context).size.height*.6,
//                 child: Card(
//                   elevation: 100,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//
//
//                   // color: Colors.purple[300],
//                   child: ListView(
//
//                     shrinkWrap: true,
//                     children: [
//                       Column(
//
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Welcome Back',
//                             style: TextStyle(color: Colors.black,
//                                 fontSize: 30,fontWeight: FontWeight.bold),
//                           ),Text(
//                             'Sign in to Continue',
//                             style: TextStyle(color: Colors.blue,
//                                 fontSize: 15),
//                           ),
//                           SizedBox(height: 30,),
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10),
//
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.black12,
//                             ),
//                             child: Row(
//                               children: [
//
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.email_outlined,color: Colors.black38,),
//                                 SizedBox(width: 25,),
//
//                                 Expanded(child: TextFormField(
//                                   autofocus: false,
//                                   onChanged: (value){
//
//                                   },
//
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       labelText: 'Email OR Phone'
//                                   ),
//                                   controller: emailController,
//                                   validator: (value){
//                                     if(value==null || value.isEmpty){
//                                       return 'please enter email';
//                                     }
//                                     else if (!value.contains('@')){
//                                       return 'Please enter valid email';
//                                     }
//                                     return null;
//                                   },
//
//                                 ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 15,),
//
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.black12,
//                             ),
//                             child: Row(
//                               children: [
//
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.lock,color: Colors.black38,),
//                                 SizedBox(width: 25,),
//
//                                 Expanded(child: TextFormField(
//                                   onChanged: (value){
//
//                                   },
//                                   autofocus: false,obscureText: true,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       labelText: 'Password'
//                                   ),
//                                   controller: passwordController,
//                                   validator: (value){
//                                     if(value==null || value.isEmpty){
//                                       return 'Please enter password';
//                                     }
//                                     return null;
//                                   },
//
//                                 ),
//                                 ),
//                                 Icon(Icons.remove_red_eye_outlined),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height:15,),
//
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10),
//
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.black12,
//                             ),
//                             child: Row(
//                               children: [
//
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.lock,color: Colors.black38,),
//                                 SizedBox(width: 25,),
//
//                                 Expanded(child: TextFormField(
//                                   onChanged: (value){
//
//                                   },
//                                   obscureText: true,
//                                   autofocus: false,
//                                   controller: confirmPasswordController,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       labelText: 'Confirm Password'
//                                   ),
//                                   validator: (value){
//                                     if(value==null || value.isEmpty){
//                                       return 'Please enter password';
//                                     }
//                                     return null;
//
//                                   },
//
//                                 ),
//                                 ),
//                                 Icon(Icons.remove_red_eye_outlined),
//                               ],
//                             ),
//                           ),
//                           // SizedBox(height: 10,),
//                           // Container(
//                           //   margin: EdgeInsets.only(left: 10),
//                           //   child: Row(
//                           //     children: [
//                           //       Text('Forget Password ?',style: TextStyle(fontWeight: FontWeight.bold),),
//                           //     ],
//                           //   ),
//                           // ),
//                           SizedBox(height: 30,),
//                           RawMaterialButton(
//                             padding: EdgeInsets.symmetric(horizontal: 90),
//
//                             fillColor: Colors.cyan,
//                             onPressed: (){
//                               setState(() {
//                                 if(_formKey.currentState!.validate()){
//                                   email =emailController.text;
//                                   password =passwordController.text;
//                                   confirmPassword=confirmPasswordController.text;
//                                   registration();
//                                 }
//                               });
//                             },
//                             child: Text('Sign Up',style: TextStyle(color: Colors.white),),),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("you have an Account",style: TextStyle(fontWeight: FontWeight.bold),),
//                               TextButton(onPressed: (){
//                                 Navigator.pop(context);
//                               }, child: Text('Sign In',style: TextStyle(color: Colors.cyanAccent),)),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 300,),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";
  var name="";
  var phone="";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController= TextEditingController();
  final phoneControlleer = TextEditingController();
  FocusNode emailFocusNode =FocusNode();
  FocusNode passwordFocusNode =FocusNode();
  FocusNode confirmpasswordFocusNode =FocusNode();



  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> _obscureconfirmPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneControlleer.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmpasswordFocusNode.dispose();
    _obscureconfirmPassword.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Registered Successfully. Please Login..",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password Provided is too Weak");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print("Account Already exists");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
    // if (password == confirmPassword) {
    //   try {
    //     UserCredential userCredential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(email: email, password: password);
    //     print(userCredential);
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         backgroundColor: Colors.redAccent,
    //         content: Text(
    //           "Registered Successfully. Please Login..",
    //           style: TextStyle(fontSize: 20.0),
    //         ),
    //       ),
    //     );
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Login(),
    //       ),
    //     );
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'weak-password') {
    //       print("Password Provided is too Weak");
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: Colors.orangeAccent,
    //           content: Text(
    //             "Password Provided is too Weak",
    //             style: TextStyle(fontSize: 18.0, color: Colors.black),
    //           ),
    //         ),
    //       );
    //     } else if (e.code == 'email-already-in-use') {
    //       print("Account Already exists");
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: Colors.orangeAccent,
    //           content: Text(
    //             "Account Already exists",
    //             style: TextStyle(fontSize: 18.0, color: Colors.black),
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // }
    // else {
    //   print("Password and Confirm Password doesn't match");
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       backgroundColor: Colors.orangeAccent,
    //       content: Text(
    //         "Password and Confirm Password doesn't match",
    //         style: TextStyle(fontSize: 16.0, color: Colors.black),
    //       ),
    //     ),
    //   );
    // }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:SafeArea(
        child: Form(

          key: _formKey,
          child: Container(

            // padding:EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child:Card(
              elevation: 100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),


              // color: Colors.purple[300],
              child: ListView(

                shrinkWrap: true,
                children: [
                  Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Register in to get started ',
                        style: TextStyle(color: Colors.black54,
                            fontSize: 20,),
                      ),
                      const SizedBox(height: 15,),
                      const Text(
                        'Experience the all new App! ',
                        style: TextStyle(color: Colors.black54,
                          fontSize: 20,),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),


                        child: Row(
                          children: [

                            Expanded(child: TextFormField(
                              autofocus: false,
                              onChanged: (value){

                              },
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                prefixIcon: Icon(Icons.manage_accounts_rounded),
                              ),

                              controller: nameController,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return 'please enter name';
                                }
                                return null;
                              },


                            ),
                            ),



                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),


                        child: Row(
                          children: [

                            Expanded(child: TextFormField(
                              autofocus: false,
                              onChanged: (value){

                              },
                              decoration: const InputDecoration(
                                  labelText: 'Email',
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



                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children:  [

                          Expanded(child: TextFormField(
                            autofocus: false,
                            onChanged: (value){

                            },
                            decoration: const InputDecoration(
                              labelText: 'phone',
                              prefixIcon: Icon(Icons.phone),
                            ),

                            controller: phoneControlleer,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return 'please enter number';
                              }
                              else if (value.length!=10){
                                return 'Please enter valid 10 digit number';
                              }
                              return null;
                            },


                          ),
                          ),


                        ],
                      ),




                      const SizedBox(height: 15,),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),

                        child: Row(
                          children: [
                            Expanded(child:
                            ValueListenableBuilder(valueListenable: _obscurePassword,
                                builder: (context,value,child){
                                  return TextFormField(

                                    focusNode: passwordFocusNode,

                                    obscureText: _obscurePassword.value,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
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
                            ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 20,),
                      ValueListenableBuilder(valueListenable: _obscureconfirmPassword,
                          builder: (context,value,child){
                            return TextFormField(

                              focusNode: confirmpasswordFocusNode,

                              obscureText: _obscureconfirmPassword.value,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                  labelText: 'confirmPassword',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      _obscureconfirmPassword.value =! _obscureconfirmPassword.value;
                                    },
                                    child: _obscureconfirmPassword.value ? Icon(Icons.visibility_off_outlined):
                                    Icon(Icons.visibility),
                                  )

                              ),
                              controller: confirmPasswordController,
                              validator: (value){
                                if(value==null||value !=passwordController.text || value.isEmpty){
                                  return 'Please enter correct password';
                                }
                                return null;

                              },
                            );

                          }

                      ),



                      const SizedBox(height:55,),

                      InkWell(
                        onTap: (){
                          setState(() {
                            if(_formKey.currentState!.validate()){
                              email =emailController.text;
                              password =passwordController.text;
                              confirmPassword =passwordController.text;
                              phone=phoneControlleer.text;
                              registration();
                            }
                          });
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

                      const SizedBox(height: 30,),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account",style: TextStyle(fontWeight: FontWeight.w400),),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          }, child: const Text('LogIn',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 300,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
