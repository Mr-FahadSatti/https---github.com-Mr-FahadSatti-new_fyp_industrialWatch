import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../api/ipaddress.dart';
import '../../customs/customTextField.dart';
import '../../customs/customtext.dart';
import '../../customs/custumbutton.dart';
import 'model/organization.dart';

class AddAdmin extends StatefulWidget {
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _AddAdmin();
}

class _AddAdmin extends State<AddAdmin> {
  TextEditingController unamectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  List<String> orlist = [];
 
  List<DropdownMenuItem<String>> getOrgitems() {
    List<DropdownMenuItem<String>> orgitems = [];
    for (var e in orlist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      orgitems.add(obj);
    }
    return orgitems;
  }

  void initState() {
    getOrg();
  }
  List<Organization> olist=[];

  Organization o=new Organization();

  getOrg()async{
    olist=await o.getAllOrg();
    for (var e in olist) {
      orlist.add(e.name);
    }
    setState(() { });
  }

  String? selectedOrg;
  bool? _passwordVisible = true;
  TextEditingController emailctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Add Admin",
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
              // CustomText("Add Admin", Colors.white, 25),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    //CustomText("SignIn", Colors.black, 40.0),
                    // SizedBox(
                    //   height: 50,
                    // ),
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
                        "Email",
                        "Email",
                        null,
                        false,
                        emailctr,
                        Icon(Icons.person,
                            size: 35,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253))),
                    SizedBox(
                      height: 20,
                    ),

                    InputDecorator(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: Theme(
                        data: Theme.of(context).copyWith(
                            //canvasColor: Color.fromARGB(255, 119, 235, 253),
                            canvasColor: Colors.black),
                        child: DropdownButton(
                          hint: CustomText(
                              "Select Your Organization", Colors.white, 18),
                          value: selectedOrg,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          isDense: true,
                          isExpanded: true,
                          items: getOrgitems(),
                          onChanged: (Value) {
                            setState(() {
                              selectedOrg = Value!;
                            });
                          },
                        ),
                      )),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      controller: passctr,
                      keyboardType: TextInputType.text,
                      obscureText: _passwordVisible!,
                      obscuringCharacter: "*",
                      //validator: (pass) => pass!.length < 6 ? 'Password too short.' : null,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 119, 235, 253),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible!
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              //color: Colors.white,
                              color: Color.fromARGB(255, 119, 235, 253),
                              //color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible!;
                              });
                            },
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                    SizedBox(height: 20,),
                    
                    CustomButton(() async{
                    String url='${ip}/add_user';
                    
      var request   = http.MultipartRequest('POST',Uri.parse(url));
     
      request.fields['name']=unamectr.text;
      request.fields['email']=emailctr.text;
      request.fields['password']=passctr.text;
      request.fields['role']="admin";
      o=olist.where((element) => element.name==selectedOrg).first;
      request.fields['org_id']=o.oid.toString();

      var response=await request.send();
        if(response.statusCode==200)
        {
          print("Admin Added!");
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
