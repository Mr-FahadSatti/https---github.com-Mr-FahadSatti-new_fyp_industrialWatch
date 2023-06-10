import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';


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
      // setState(() {
      //
      // });
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

