import 'package:flutter/material.dart';
import 'package:ott/home.dart';
import 'package:ott/video.dart';
import 'package:provider/provider.dart';

import 'bot.dart';

class FavouriteModel extends ChangeNotifier {
  List<String> pic = [
    "assets/balganesh.jpg",
    "assets/dc3.jpg",
    "assets/doreman.jpg",
    "assets/img_5.png",
    "assets/k4.jpg",
    "assets/shin.jng",
  ];

  List<String> txt = [
    "RIO",
    "Pirates",
    "Cobweb",
    "hobbit",
    "Tintin",
    "Harry Potter",
  ];

  List<String> subtxt = [
    "2h 13m - 616MB",
    "1h 45m - 679Mb",
    "3h 46m - 456MB",
    "2h 25m - 567MB",
    "1h 56m - 654MB",
    "2h 20m - 450MB",
  ];
}

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  List pic = [
    "assets/dc1.jpg",
    "assets/dc3.jpg",
    "assets/dc7.jpg",
    "assets/img_5.png",
    "assets/k4.jpg",
    "assets/k3.jpg",
  ];
  List txt = [
    "Premum",
    "Siragadika asai",
    "Indian",
    "Bahubali",
    "Korean",
    "K-Drama",
  ];
  List subtxt=[
    "2h 13m - 616MB",
    "1h 45m - 679Mb",
    "3h 46m - 456MB",
    "2h 25m - 567MB",
    "1h 56m - 654MB",
    "2h 20m - 450MB",
  ] ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteModel() ,
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> bot()));
          },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyText1 !.color
            ),


          ),
        ),
        body: SafeArea(

          child:

          Consumer<FavouriteModel>(
            builder: (context,themedata,_) => ListView.builder(
              itemBuilder:(BuildContext context,int index){
                return ListTile(
                  onTap: (){
                  },
                  leading:GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => video()));
                    },
                    child: Container(
                      width: 100,
                      height:60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(pic[index],),fit: BoxFit.fill
                        ),
                      ),),
                  ),
                  title:Text(txt[index],style: TextStyle(color: Theme.of(context).textTheme.bodyText1 !.color,fontSize: 15,fontWeight: FontWeight.bold),),
                  subtitle:Text(subtxt[index],style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color,),),
                  trailing:Icon(Icons.more_vert_rounded,color: Theme.of(context).textTheme.bodyText1!.color,) ,
                );
              } ,
              itemCount: pic.length,
            ),
          ),
        ),
      ),
    );
  }
}