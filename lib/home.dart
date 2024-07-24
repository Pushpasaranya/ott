import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ott/themeprovider.dart';
import 'package:ott/video.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'mode.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int currentPage = 0;

  List<String> caro1 = [
    'assets/dc1.jpg',
    'assets/dc2.jpg',
    'assets/dc3.jpg',
    'assets/dc4.jpg',
    'assets/dc5.jpg',
    'assets/dc6.jpg',
    'assets/dc7.jpg',
    'assets/dc8.jpg',
  ];
  List<String> cartext = [
    'Tamil . Family . Drama . Betrayal',
    '7 languages . Action . Drama . Adventure',
    'Reality . Celebrities . Tamil . Music',
    'Tamil . Family . Drama . Betrayal',
    '7 languages . Action . Drama . Adventure',
    'Reality . Celebrities . Tamil . Music',
    'Tamil . Family . Drama . Betrayal',
    '7 languages . Action . Drama . Adventure',
  ];

  List<String> btxt = [
    'Subscribe to Watch',
    'Watch Free',
    'Watch Now',
    'Subscribe to Watch',
    'Watch Free',
    'Watch Now',
    'Subscribe to Watch',
    'Watch Free',
  ];

  List<String> li1image = [
    'assets/sira.jpg',
    'assets/cook.jpg',
    'assets/bak.jpg',
    'assets/bb.jpg',
    'assets/dc1.jpg',
  ];
  List<String> li1txt = [
    'S4 E1 • 19 Feb',
    'Cook with comali',
    'S1 E786 • 16 May',
    'Biggboss • S5',
    'Premam movie'
  ];
  List<String> c2image = [
    'assets/c2.jpg',
    'assets/c2.1.jpg',
    'assets/c2.2.jpg',
    'assets/c2.3.jpg',
    'assets/c2.jpg',
  ];
  List<String> li2image = [
    'assets/k1.jpg',
    'assets/k2.jpg',
    'assets/k3.jpg',
    'assets/k4.jpg',
    'assets/k5.jpg',
  ];
  List<String> hotbImages = [
    'assets/hotb.png',
    'assets/starplus.jpg',
    'assets/starworld.jpg',
    'assets/stvijay.jpg',

  ];
  List<String> li3image = [
    'assets/niya.jpg',
    'assets/img_2.png',
    'assets/pand.jpg',
    'assets/disney.png',
    'assets/k5.jpg',
  ];
  List<String> li4image = [
    'assets/dc3.jpg',
    'assets/img_6.png',
    'assets/k5.jpg',
    'assets/bak.jpg',
    'assets/c2.jpg',
  ];
  List<String> li5image = [
    'assets/dc3.jpg',
    'assets/img_.png',
    'assets/k5.jpg',
    'assets/bak.jpg',
    'assets/c2.jpg',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
         Text('Disney Hotstar',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,

        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => video()),
                    );
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 300,
                            viewportFraction: 1.0,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPage = index;
                              });
                            },
                          ),
                          itemCount: caro1.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              child: Image.asset(
                                caro1[itemIndex],
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/dss.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  cartext[currentPage],
                  style: TextStyle(   color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF2d3039),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder:  (context) => const video()));

                          },
                          icon: Icon(
                            Icons.play_arrow_sharp,
                            size: 30,
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          btxt[currentPage],
                          style: TextStyle(   color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF2d3039),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 20,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity,

                child: Center(
                  child: DotsIndicator(
                    mainAxisSize: MainAxisSize.min,
                    dotsCount: caro1.length,
                    position: currentPage.toInt(),
                    decorator: DotsDecorator(
                      size: Size(5.0, 5.0),
                      activeSize: Size(5.0, 5.0),
                      color: Colors.grey,
                      activeColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Continue Watching for SARA...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: li1image.length,
                  itemBuilder: (BuildContext c, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(0.1),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              image: DecorationImage(
                                image: AssetImage(li1image[index]),
                                fit: BoxFit.fill,
                              ),
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                li1txt[index],
                                style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
                              ),
                              SizedBox(width: 30),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  size: 15,
                                ),
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    animateToClosest: true,
                    height: 200,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ),
                  itemCount: c2image.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4.5,
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      child: Image.asset(
                        c2image[itemIndex],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    'K-Dramaland',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: li2image.length,
                  itemBuilder: (BuildContext c, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(1),
                          width: 160,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            image: DecorationImage(
                              image: AssetImage(li2image[index]),
                              fit: BoxFit.fill,
                            ),
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],

                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4.5,
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: li3image.length,
                  itemBuilder: (BuildContext c, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(1),
                          width: 160,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            image: DecorationImage(
                              image: AssetImage(li3image[index]),
                              fit: BoxFit.fill,
                            ),
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: li4image.length,
                  itemBuilder: (BuildContext c, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(1),
                          width: 160,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            image: DecorationImage(
                              image: AssetImage(li4image[index]),
                              fit: BoxFit.fill,
                            ),
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}

