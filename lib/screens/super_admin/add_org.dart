import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api/ipaddress.dart';
import '../../customs/customTextField.dart';
import '../../customs/custumbutton.dart';

class AddOrg extends StatefulWidget {
  const AddOrg({super.key});

  @override
  State<AddOrg> createState() => _SignInState();
}

class _SignInState extends State<AddOrg> {
  TextEditingController unamectr = TextEditingController();
  TextEditingController adrsctr = TextEditingController();
  
  String? selectedOrg;
  String? selectedRol;
  bool? _passwordVisible = true;
  TextEditingController contactctr = TextEditingController();
  TextEditingController sectorctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Add Organization",
              style: TextStyle(color: Colors.black),
            )),
        // backgroundColor: Color.fromARGB(255, 119, 235, 253),
        //backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 20,
              // ),
             //CustomText("Add Organization", Colors.white, 25),
             SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    //CustomText("AddOrg", Colors.black, 40.0),
                    // SizedBox(
                    //   height: 50,
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                        "Name",
                        "Name",
                        null,
                        false,
                        unamectr,
                        Icon(Icons.person,
                            size: 35,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253))),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextForm(
                        "Address",
                        "Address",
                        null,
                        false,
                        adrsctr,
                        Icon(Icons.person,
                            size: 35,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253))),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextForm(
                        "Sector",
                        "Sector",
                        null,
                        false,
                        sectorctr,
                        Icon(Icons.person,
                            size: 35,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253))),
                    
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextForm(
                        "Contact",
                        "Contact",
                        null,
                        false,
                        contactctr,
                        Icon(Icons.person,
                            size: 35,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253))),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(() async{
                       String url='${ip}/add_org';
                    
      var request   = http.MultipartRequest('POST',Uri.parse(url));
     
      request.fields['name']=unamectr.text;
      request.fields['address']=adrsctr.text;
      request.fields['sector']=sectorctr.text;
      request.fields['contact']=contactctr.text;
 
      var response=await request.send();
        if(response.statusCode==200)
        {
          print("Organization Added!");
          Fluttertoast.showToast(
              msg: "Successfully Save",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
                    }, "Save", 22.0, 120, 20),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
