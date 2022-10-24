import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  late String  stringResponse;
  late Map mapResponse;
  late Map dataResponse;
   late List  listResponse;


  Future apicall() async{
    http.Response response;
    response=await http.get(Uri.parse("https://api.quotable.io/search/quotes?query=life%20happiness"));
    if(response.statusCode==200){
      setState(() {
        // stringResponse=response.body;
        mapResponse= json.decode(response.body);
        listResponse=mapResponse['results'];

      });}}

  @override
  void initState() {
    apicall();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;

    return Scaffold(
      body:  Container(
        height: height,
        width: width,
        // color: Colors.orange,
        color: Colors.cyan,
        child: CarouselSlider.builder(
            itemCount: listResponse.length,
            itemBuilder: (context,index1,index2){
              return  Padding(
                padding: const EdgeInsets.all(20.0),
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(listResponse[index1]['content'].toString(),
                      style: TextStyle(fontSize: 30,color: Colors.white),),

                    SizedBox(height: 40,),
                    Text(listResponse[index1]['author'].toString()),
                  ],
                ),
              );
            },
            options: CarouselOptions(
                scrollDirection: Axis.vertical,
                pageSnapping: true,initialPage: 0,
                enlargeCenterPage: true,

                onPageChanged: (index,value){
                  HapticFeedback.lightImpact();
                }
            )),
      ),
    );
  }
}
