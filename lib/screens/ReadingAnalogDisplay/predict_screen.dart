import 'dart:io'; // Changed from `import 'dart:html';`

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

import '../../customs/custumbutton.dart';

class TextRecognize extends StatefulWidget {
  const TextRecognize({Key? key}) : super(key: key);

  @override
  State<TextRecognize> createState() => _TextRecognizeState();
}

class _TextRecognizeState extends State<TextRecognize> {

  bool textscanning=false;
  String scanText="";
//  File? img;
  XFile? imgfile;
  void getImage(ImageSource source) async{
    try {
      final pickedimage= await ImagePicker().pickImage(source: source);
      if(pickedimage !=null)
      {
        textscanning=true;
        imgfile=pickedimage;
        await getText(pickedimage);
        setState(() {

        });
      }
    }catch(e){
      textscanning=false;
      imgfile =null;
      scanText="Error accoured while scanning";
    }}

  Future<void> getText(XFile image) async
  {
    print("hereeeeeeeeeeeeeeeeeeeeeeee");
    final inputImage= InputImage.fromFilePath(image.path);
    final textDecorator=GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText=await textDecorator.processImage(inputImage);
    await textDecorator.close();
    scanText="";
    for(TextBlock block in recognizedText.blocks)
    {
      for(TextLine line in block.lines)
      {
        scanText=scanText+line.text+"\n" ;
      }
    }
    print("Text : ----------------------"+scanText);
    textscanning=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 53, 103),
      appBar:AppBar(title: Text("Text Recognition"),),
      body:SingleChildScrollView(
      child:Padding(padding: const EdgeInsets.all(25.0), child:Column(
        children: [

          if(textscanning)
            CircularProgressIndicator(),
          if(!textscanning && imgfile==null)
            Container(
              width: 200,height: 300,
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.only(top: 10),

              color: Colors.grey,
            ),
          if(imgfile!=null)
            Container(
              height: 200,width:200,
              child: Image.file(File(imgfile!.path),fit: BoxFit.fill,),
            ),
         SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
         CustomButton((){
           getImage(ImageSource.gallery);
         }, "Gallary", 15, 15, 10),
           SizedBox(width: 5,),
             CustomButton((){
               getImage(ImageSource.camera);
             }, "Camera", 15, 15, 10)
           ]),
          SizedBox(height: 20,),
          Text("Reading  $scanText",style: TextStyle(fontSize: 20,color: Colors.white),),
        ],
      ),),),
    );
  }
}