import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class capturePage extends StatefulWidget {
  const capturePage({Key? key}) : super(key: key);

  @override
  _capturePageState createState() => _capturePageState();
}

class _capturePageState extends State<capturePage> {
  File? image;
  Future pickImage(ImageSource source) async{
  try {
    final image=await ImagePicker().pickImage(source: source);
    if(image==null) return;
    final imageTemp=File(image.path);
    setState(() {
      this.image=imageTemp;
    });
  } on PlatformException catch (e)
   {
     print("Failed to pick image $e!");
  }


  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Capture"),
        backgroundColor: Color(0xFF0C3823),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Ink( 

                  //margin: EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xff00b09b), Color(0xff96c93d)]),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(6),
                    )
                    ,child: TextButton.icon(autofocus: true,onPressed: (){ pickImage(ImageSource.camera);}, label: Text("Capture",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),icon: Icon(FontAwesomeIcons.camera,color: Colors.black,))),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Ink(
                    decoration:BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xff00b09b), Color(0xff96c93d)]),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(6),
                    )
                    ,child: TextButton.icon(autofocus: true,onPressed: (){pickImage(ImageSource.gallery);}, label: Text("Gallery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),icon: Icon(FontAwesomeIcons.fileImage,color: Colors.black,),)),
              ),
              image !=null?Image.file(image!
              ,fit: BoxFit.cover,):Image(image: AssetImage("assest/snakeEyeLogo.jpg"),)




            ],
          ),
        ),
      ),
    );
  }
}
