import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../../../api/ipaddress.dart';
import '../../customs/customtext.dart';
import '../../customs/custumbutton.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  File? img;

  Uint8List? _imageBytes;

  Future<void> _sendImageToServer() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final fileBytes = await pickedFile!.readAsBytes();
    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${ip}/getmodel'),
    );
    final multipartFile = http.MultipartFile.fromBytes(
      'img',
      fileBytes,
      filename: 'model.jpg',
    );
    request.fields["type"] = 1.toString();
    request.files.add(multipartFile);
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBytes = await response.stream.toBytes();
      setState(() {
        _imageBytes = responseBytes;
      });
    } else {
      throw Exception('Failed to send image');
    }
  }

  getImg() {
    if (_imageBytes != null) {
      return Container(
          height: (MediaQuery.of(context).size.height) * 0.35,
          width: (MediaQuery.of(context).size.width) * 0.80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(_imageBytes!),
              fit: BoxFit.fill,
            ),
          ));
    }
    {
      return Container(
        height: (MediaQuery.of(context).size.height) * 0.25,
        width: (MediaQuery.of(context).size.width) * 0.37,
        color: Color.fromARGB(255, 247, 245, 245),
        child: Icon(
          Icons.person,
          size: 140,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText("Meter Inspection", Colors.black, 20)),
      backgroundColor: Color.fromARGB(255, 0, 53, 103),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              getImg(),
              Center(
                child: Container(
                  height: (MediaQuery.of(context).size.height) * 0.35,
                  //width: (MediaQuery.of(context).size.width) * 0.20,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 46,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText(
                              "Name :", Color.fromARGB(255, 119, 235, 253), 20),
                          SizedBox(
                            width: 25,
                          ),
                          CustomText("Bahdur", Colors.white, 20)
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText(
                              "Date :", Color.fromARGB(255, 119, 235, 253), 20),
                          SizedBox(
                            width: 25,
                          ),
                          CustomText("5/1/2023 ", Colors.white, 20)
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText("Time : ",
                              Color.fromARGB(255, 119, 235, 253), 20),
                          SizedBox(
                            width: 25,
                          ),
                          CustomText("8:10 PM ", Colors.white, 20)
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          CustomText("Voilation :",
                              Color.fromARGB(255, 119, 235, 253), 18),
                          SizedBox(
                            width: 1,
                          ),
                          CustomText(
                              "Phone", Color.fromARGB(255, 247, 9, 9), 15)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 0,
          ),
          Row(
            children: [
              CustomButton(() {
                setState(() {
                  _sendImageToServer();
                });
              }, "Snap", 18.0, 40, 20),
              // SizedBox(
              //   width: 70,
              // ),
              // CustomButton(() {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return EmployeeData();
              //   }));
              // }, "Save", 18.0, 40, 20)
            ],
          )
        ]),
      ),
    );
  }
}