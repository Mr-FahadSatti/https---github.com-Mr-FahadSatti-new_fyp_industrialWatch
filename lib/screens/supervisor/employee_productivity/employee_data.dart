import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_fyp_femo/screens/supervisor/employee_productivity/productivity_voilation_record.dart';

import '../../../customs/customtext.dart';
import '../../../customs/custumbutton.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  File? img;
  void initState(){
  getClick();
  }
  getClick()async{
     XFile? seletedImg = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (seletedImg != null) {
                      
                        img = File(seletedImg.path);
  }
  }
   getImg(){
    if(img!=null){
      return Container(
                height: (MediaQuery.of(context).size.height) * 0.25,
                width: (MediaQuery.of(context).size.width) * 0.37,
                color: Color.fromARGB(255, 247, 245, 245),
                
                child: Image.file(
          img!,
          fit: BoxFit.fill,
        ),
              );
    }{
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
          title: CustomText("Employee Data", Colors.black, 20)),
      backgroundColor: Color.fromARGB(255, 0, 53, 103),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              getImg(),
              Container(
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
                          width: 15,
                        ),
                        CustomText(
                            "Name :", Color.fromARGB(255, 119, 235, 253), 20),
                        SizedBox(
                          width: 25,
                        ),
                        CustomText("Bahadur", Colors.white, 20)
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
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
                          width: 15,
                        ),
                        CustomText(
                            "Time : ", Color.fromARGB(255, 119, 235, 253), 20),
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
                          width: 15,
                        ),
                        CustomText("Voilation :",
                            Color.fromARGB(255, 119, 235, 253), 18),
                        SizedBox(
                          width: 2,
                        ),
                        CustomText(
                            "Using Phone", Color.fromARGB(255, 247, 9, 9), 15)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              CustomButton(() {setState(() {
                getClick();
              });}, "Snap", 18.0, 40, 20),
              SizedBox(
                width: 70,
              ),
              CustomButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductivityVoilationRecord();
                }));
              }, "Save", 18.0, 40, 20)
            ],
          )
        ]),
      ),
    );
  }
}
