import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ott/themeprovider.dart';

import 'dart:io';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class pro extends StatefulWidget {
  pro({Key? key, }) : super(key: key);
  String name = "Name";
  var phno = "XXX";
  var location = "xxx";
  @override
  State<pro> createState() => _proState();
}
class _proState extends State<pro> {
  // final picker = ImagePicker();
  File? _image;
  final String _imageKey = 'profile_image';
  final _auth = AuthService();
  bool isSwitch = true;
  ThemeData light = ThemeData(brightness: Brightness.light);
  ThemeData dark = ThemeData(brightness: Brightness.dark);
  @override
  void initState(){
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString(_imageKey);
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }
  Future<void> _saveImageToPrefs(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, imagePath);
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImageToPrefs(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  List need = [
    "Manage profile",
    "History",
    "Visual Mode",
  ];
  List icons = [
    Icons.edit,
    Icons.history,
    Icons.toggle_off,
    // Iconswitch(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:   Theme.of(context).brightness == Brightness.dark ? Colors.white10 : Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                _image != null ?
                                CircleAvatar(
                                    radius: 60,
                                    backgroundImage:FileImage(_image!)

                                )
                                    :

                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Select Image Source"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text("Camera"),
                                              onPressed: () {
                                                _getImage(ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Gallery"),
                                              onPressed: () {
                                                _getImage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: _image != null ? FileImage(_image!) : null,
                                    child: _image == null
                                        ? Icon(Icons.add_a_photo_outlined, size: 40)
                                        : null,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                                color: Theme.of(context).textTheme.bodyText1!.color ,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Phno: ",
                              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                            ),
                            Text(
                              widget.phno,
                              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Location: ",
                              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                            ),
                            Text(
                              widget.location,
                              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 280,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: Card(
                        color:  Theme.of(context).brightness == Brightness.dark ? Colors.white10 : Colors.grey,
                        child: ListTile(
                          // onTap: (){},
                          leading: Text(
                            need[index],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color),
                          ),
                          trailing:index == 2 ?
                          Switch
                            (value: isSwitch ,
                              onChanged: (bool value){
                                setState(() {
                                  isSwitch = value;
                                });
                                final themeprovider =
                                Provider.of<ThemeProvider>(context, listen: false);
                                if (isSwitch) {
                                  themeprovider.toggleTheme();
                                } else {
                                  themeprovider.toggleTheme();
                                }
                              }
                          )
                              :
                          GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: AlertDialog(
                                            backgroundColor: Colors.black,
                                            shadowColor: Colors.white,
                                            elevation: 5,
                                            content: Column(
                                              children: [
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  controller: controller1,
                                                  keyboardType:
                                                  TextInputType.text,
                                                  decoration: InputDecoration(
                                                    hintText: "Name",
                                                    hintStyle: TextStyle(
                                                        color: Theme.of(context).textTheme.bodyText1!.color),
                                                  ),
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  controller: controller2,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "phoneNo",
                                                    hintStyle: TextStyle(
                                                        color: Theme.of(context).textTheme.bodyText1!.color),
                                                  ),
                                                ),
                                                TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  controller: controller3,
                                                  keyboardType:
                                                  TextInputType.text,
                                                  decoration: InputDecoration(
                                                    hintText: "Location",
                                                    hintStyle: TextStyle(
                                                        color: Theme.of(context).textTheme.bodyText1!.color),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          widget.name =
                                                              controller1
                                                                  .text;
                                                          widget.phno =
                                                              controller2
                                                                  .text;
                                                          widget.location =
                                                              controller3
                                                                  .text;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: Text("Edit")),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child: Text("cancel"))
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                  break;
                                case 1:
                                  break;
                                case 2:
                                  break;
                                default:
                                  break;
                              }
                            },
                            child: Icon(
                              icons[index],
                              color: Theme.of(context).textTheme.bodyText1!.color,
                              size: index == 2 ? 50 : 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: need.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}