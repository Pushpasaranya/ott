import 'package:flutter/material.dart';

import 'package:ott/favourite.dart';
import 'package:ott/home.dart';
import 'package:ott/pro.dart';

import 'package:ott/video.dart';

import 'location.dart';




class bot extends StatefulWidget {
  @override
  _botState createState() => _botState();
}

class _botState extends State<bot> {
  int index = 0;
  List pages = [
    home(),
    pro(),
    video(),
    favourite(),
    location()
  ];
  void tap(indexs){
    setState(() {
      index = indexs;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
          label: "Home",),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
            label: "Profile"),

        BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
            label: "Video"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
            label: "Fav"),
        BottomNavigationBarItem(icon: Icon(Icons.location_on_rounded,color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
            label: "location"),

      ],
        currentIndex: index,
        onTap: tap,
      ),
    );
  }
}

