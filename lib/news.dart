// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
//
// class News extends StatefulWidget {
//
//
//   const News({Key? key}) : super(key: key);
//
//   @override
//   State<News> createState() => _NewsState();
// }
//
// class _NewsState extends State<News> {
//    String ?stringResponse;
//    Map ?mapResponse;
//    Map ?dataResponse;
//    List ?listRespone;
//   Future apicall()async{
//     http.Response response;
//     response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=499e683f0efd4049a076f0207f930315"));
//     if(response.statusCode==200){
//       setState(() {
//         mapResponse = json.decode(response.body);
//         listRespone = mapResponse!['articles'];
//       });
//
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     apicall();
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(
//             'News'
//         ),
//       ),
//       body:
//       ListView.builder(itemBuilder: (context,index){
//         return  Container(
//             margin: EdgeInsets.only(left: 10,right: 10,),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30)
//             ),
//             child: listRespone!=null?CircularProgressIndicator(): Card(
//
//
//               child:   Row(
//                 children: [
//
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(listRespone![index]['publishedAt'].toString()),
//
//
//                         Text(listRespone![index]['title'].toString(),
//                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//                         Text(listRespone![index]['description'].toString()),
//
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 100,
//
//
//                     child: Image(
//                       image: NetworkImage(
//                         listRespone![index]['urlToImage'],
//                       ),
//
//                     ),
//                   ),
//                 ],
//
//               ),
//             )
//         );
//       },
//         itemCount: listRespone==null?0:listRespone!.length,
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class News extends StatefulWidget {


  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late String stringResponse;
  late Map mapResponse;
  late Map dataResponse;
  List ?listRespone;
  Future apicall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=499e683f0efd4049a076f0207f930315"));
    if(response.statusCode==200){
      setState(() {
        mapResponse = json.decode(response.body);
        listRespone = mapResponse['articles'];
      });

    }
  }


  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
            'News'
        ),
      ),
      body:
      ListView.builder(itemBuilder: (context,index){
        return  Container(
            margin: EdgeInsets.only(left: 10,right: 10,),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child: listRespone==null?CircularProgressIndicator(): Card(


              child:   Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listRespone![index]['publishedAt'].toString()),


                        Text(listRespone![index]['title'].toString(),
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text(listRespone![index]['description'].toString()),

                      ],
                    ),
                  ),
                  Container(
                    width: 100,


                    child: Image(
                      image: NetworkImage(
                        listRespone![index]['urlToImage'],
                      ),

                    ),
                  ),
                ],

              ),
            )
        );
      },
        itemCount: listRespone==null?0:listRespone!.length,
      ),
    );
  }
}
