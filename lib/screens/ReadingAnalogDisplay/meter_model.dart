import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:new_fyp_femo/screens/ReadingAnalogDisplay/text_recognition.dart';

import '../../api/ipaddress.dart';

class Meter {
  late int id,emp_id;
  late String meter_name,date,time,reading,m_name,emp_name;
  late String meter_unit;//meter_type;
  late int org_id;
  late Uint8List image;
  dynamic? imageBytes;

  Meter();


  Meter.fromMap(Map<String, dynamic>smap)
  {
    id = smap["id"];
    meter_name = smap["name"];
    meter_unit = smap["unit"];
    //meter_type = smap["type"];
  }

  Map<String, dynamic> tomap() {
    Map<String, dynamic> mp = Map<String, dynamic>();
    mp["org_id"] = id;
    mp["meter_name"] = meter_name;
    mp["meter_unit"] = meter_unit;
    //mp["meter_type"] = meter_type;
    return mp;
  }

  Future<String?> AddMeterMultipart(Meter m) async
  {
    print("function in");
    String url = '${ip}/add_Meter';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields["org_id"] = m.org_id.toString();
    request.fields["meter_name"] = m.meter_name;
    request.fields["meter_unit"] = m.meter_unit;
    //request.fields["meter_type"] = m.meter_type;
    var response = await request.send();
    if(response.statusCode==200)
    {
      return response.stream.bytesToString();
    }
    else{
     return  null;
    }
  }




  Future<String?> MeterAcqusitionMultipart(Meter m)async
  {
    String url = '${ip}/MeterAcqusition';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['emp_id'] = emp_id.toString();
    request.fields["meter_id"] = id.toString();
    request.fields["reading"] = reading;
    request.fields["date"] = date;
    request.fields["time"] = time;
    final multipartFile =http.MultipartFile.fromBytes(
      'image',
      imageBytes!,
      filename: 'model.jpg',
    );
    print("sending data to acquisition -----------");
    print("image bytes ----->${imageBytes}");
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfully Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 18.0
      );
      print("aquuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu--------");
      return response.stream.bytesToString();
    }
    else {
      print("saving acquisition ------------------------------");
      return null;
    }
  }

  Future<List<Meter>> getAllMeter(int oid)async{
    String urll='${ip}/get_all_meter';
    var req =http.MultipartRequest('GET',Uri.parse(urll));
    req.fields["org_id"]=oid.toString();
    var resp=await req.send();
    String result = await resp.stream.bytesToString();
    print(result);
    if(resp.statusCode==200){
      print("2000000000000000000000000");
      List jsonlst = jsonDecode(result);
      return jsonlst.map((e) => Meter.fromMap(e)).toList();
    }else{
      return [];
    }
  }


  Meter.fromMap2(Map<String, dynamic>smap)
  {
    emp_name = smap["worker_name"];
    meter_name = smap["meter_name"];
    meter_unit = smap["meter_unit"];
    reading= smap["reading"];
    date=smap["date"];
    time=smap["time"];
    var imag=smap["image"];
    image=base64Decode(imag);
  }

  Future<List<Meter>> Get_data_for_supervisor(int uid) async {
    String url = '$ip/get_MeterAcqusition_record';
    var request = await http.MultipartRequest('GET', Uri.parse(url));
    request.fields['user_id'] = uid.toString();
    print("Entered in all record loop");
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Mere m data h boss');
      var result = await response.stream.bytesToString();
      print("result of all record ${result}");
      List data = jsonDecode(result);
      return data.map((e) => Meter.fromMap2(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<String> getText(XFile image) async
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
    return scanText;
  }


}