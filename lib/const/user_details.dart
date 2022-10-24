// import 'package:email_verfiy/pages/signup.dart';
// import 'package:flutter/material.dart';
//
//
// enum SingingCharacter { man, female }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         margin: EdgeInsets.fromLTRB(40, 70, 70, 60),
//         padding: EdgeInsets.only(top: 70),
//         child: Column(
//           children: <Widget>[
//             ListTile(
//               title:  Row(
//                 children: [
//                   Text('man',style: TextStyle(
//                     fontSize: 30,
//                   ),),
//                   Icon(Icons.man,size: 40,),
//                 ],
//               ),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.man,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title:  Row(
//
//                 children: [
//                   Text('female',style: TextStyle(
//                     fontSize: 30,
//                   ),),
//                   Icon(Icons.woman,size: 40,),
//                 ],
//               ),
//
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.female,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(height: 70,),
//
//
//             TextFormField(
//
//               maxLength: 3,
//               keyboardType: TextInputType.phone,
//               autofocus: false,
//               decoration: InputDecoration(
//                 labelText: 'age',
//                 labelStyle: TextStyle(fontSize: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//
//               ),
//             ),
//             SizedBox(height: 20,),
//             TextFormField(
//               autofocus: false,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 labelStyle: TextStyle(fontSize: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//
//               ),
//             ),
//             SizedBox(height: 20,),
//
//             IconButton(onPressed: (){
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, a, b) => Signup(),
//                     transitionDuration: Duration(seconds: 0),
//                   ),
//                       (route) => false);
//             }, icon:Icon(Icons.forward,size: 40,)),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//   SingingCharacter? _character = SingingCharacter.man;
// }
//
