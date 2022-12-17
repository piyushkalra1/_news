import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../pages/topbutton.dart';



class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  final selectedIndexNotifier = ValueNotifier<int?>(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),shape: BoxShape.rectangle
                ),
                child: Carousel(
                  dotColor: Colors.white,
                  animationDuration:const Duration(seconds: 3),
                  showIndicator: false,
                  images: [
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: ClipRRect(borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/Rect.jpg'),
                              fit: BoxFit.fill
                            )
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Column(
                                children: [
                                  SizedBox(height: 50,),
                                  Container(

                                    child: Image(
                                    image: AssetImage('images/like.png',),
                                  ),),
                                  SizedBox(height: 30,),
                                  Container(
                                    height:30,
                                    width: 130,
                                    child: Image(
                                      image: AssetImage('images/arrow.png',),
                                    ),)

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(borderRadius:BorderRadius.circular(20),
                          child: const Image(image:
                          NetworkImage('https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                          ),fit: BoxFit.fill,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(borderRadius:BorderRadius.circular(20),
                          child: const Image(image:
                          NetworkImage(    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
                          ),fit: BoxFit.fill,)),
                    ),
                  ],
                  dotBgColor: Colors.transparent,
                )
            ),
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('Eyevy',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      Text("Full Rim Round, Cat-eyed Anti Glare Frame/(48 mm)",textAlign: TextAlign.center,),
                      Row(
                        children: const [
                          Text('रु 219',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,),),
                          Text('रु 219',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 22,),),
                          Text('78 % off',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.green),)
                        ],
                      )

                    ],
                  ),
                  Center(child: Column(
                    children: const [
                      Text('Best Fruit Shop',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('get fresh and healthy fruits\n for you',textAlign: TextAlign.center,),
                    ],
                  )),
                  Center(child: Column(
                    children: const [
                      Text('Best Fruit Shop',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('organics fruits\n that can be enjoyed everyone',textAlign: TextAlign.center,),
                    ],
                  )),



                ],
                dotBgColor: Colors.transparent,
                showIndicator: true,
                animationDuration: const Duration(milliseconds:10),
              ),
            ),
            Card(


                child: ValueListenableBuilder<int?>(

                    valueListenable: selectedIndexNotifier,
                    builder: (_, selectedIndex, __) => Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyWidget(
                            key: ValueKey(1),
                            text: "Add to cart",
                            isFavorite: selectedIndex == 1,
                            onPressed: (){
                              selectedIndex == 1 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 1;
                              setState(() {


                              });
                            }
                        ),
                        MyWidget(
                            key: ValueKey(2),
                            text: " Buy now",

                            isFavorite: selectedIndex == 2,
                            onPressed: () { selectedIndex == 2 ? selectedIndexNotifier.value = null : selectedIndexNotifier.value = 2;
                            setState(() {
                            });
                            }
                        ),

                      ],
                    ))),



          ],
        ),
      ),
    );
  }
}

