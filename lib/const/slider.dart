import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class GoogleAuthentication extends StatefulWidget {
  const GoogleAuthentication({Key? key}) : super(key: key);

  @override
  State<GoogleAuthentication> createState() => _GoogleAuthenticationState();
}

class _GoogleAuthenticationState extends State<GoogleAuthentication> {
  List<int> list = [1, 2, 3, 4, 5];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              margin:const EdgeInsets.fromLTRB(10, 40, 10, 30),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),shape: BoxShape.rectangle
              ),
              child: Container(
                  child: CarouselSlider(

                    options: CarouselOptions(),
                    items: imgList
                        .map((item) => Container(
                      child: Center(
                          child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                    ))
                        .toList(),
                  ),
              ),
              // child:  Container(
              //     child: CarouselSlider(
              //       options: CarouselOptions(),
              //       items: list
              //           .map((item) =>
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: ClipRRect(borderRadius:BorderRadius.circular(20),
              //                 child: const Image(image:AssetImage('assets/image2.jpeg'),fit: BoxFit.fill,)),
              //           ),
              //       //     Container(
              //       //   child: Center(child: Text(item.toString())),
              //       //   color: Colors.green,
              //       // ),
              //       )
              //           .toList(),
              //     )),
              // child: Carousel(
              //   dotColor: Colors.white,
              //   animationDuration:const Duration(seconds: 2),
              //   showIndicator: true,
              //   images: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ClipRRect(borderRadius: BorderRadius.circular(20),
              //         child: const Image(image:AssetImage('assets/image1.jpeg'),fit: BoxFit.fill,),),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ClipRRect(borderRadius:BorderRadius.circular(20),
              //           child: const Image(image:AssetImage('assets/image2.jpeg'),fit: BoxFit.fill,)),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ClipRRect(borderRadius:BorderRadius.circular(20),
              //           child: const Image(image:AssetImage('assets/image3.jpeg'),fit: BoxFit.fill,)),
              //     ),
              //   ],
              //   dotBgColor: Colors.transparent,
              // )
            ),
            const SizedBox(
              height: 0,
            ),
            // SizedBox(
            //   height: 30,
            //   width: MediaQuery.of(context).size.width,
            //   child: Carousel(
            //     images: [
            //       Center(child: Text('MVP: Idea to Implementation',
            //           style: kGoogleTextStyle)),
            //       Center(child: Text('Sky rocket your idea with MVP',
            //         style: kGoogleTextStyle,)),
            //       Center(child: Text('Get Boost with StarterStartUp',style:kGoogleTextStyle,
            //       )),
            //     ],
            //     dotBgColor: Colors.transparent,
            //     showIndicator: false,
            //     animationDuration: const Duration(milliseconds:10),
            //   ),
            // ),
            const SizedBox(
              height: 120,
            ),


            Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Center(child: Text('You can register or login easily with your gmail account',style: TextStyle(fontSize: 11,color: Colors.grey.withOpacity(0.7)),))
              ),
            ),

          ],
        ),
      ),
    );
  }
}

