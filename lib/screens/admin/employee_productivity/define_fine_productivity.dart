import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../api/ipaddress.dart';
import '../../../customs/customTextField.dart';
import '../../../customs/customtext.dart';
import '../../../customs/custumbutton.dart';
import '../../../model/rule_fine.dart';
import '../../../model/users.dart';
import '../../super_admin/model/productivity_rule.dart';

class DefineFineProductivity extends StatefulWidget {
  List<Users> ulist=[];
  
  DefineFineProductivity(this.ulist);

  @override
  State<DefineFineProductivity> createState() => _DefineFineProductivityState();
}

class _DefineFineProductivityState extends State<DefineFineProductivity> {
  RuleFine rf=new RuleFine();
  List<RuleFine> rflist=[];
  List<String> rulelist = [];
  TextEditingController finectr = TextEditingController();
  List<String> flist = [];
  List<DropdownMenuItem<String>> getRuleitems() {
    List<DropdownMenuItem<String>> rolitems = [];
    for (var e in rulelist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      rolitems.add(obj);
    }
    return rolitems;
  }
   
  void initState() {
    getRule();
  }
  List<rule> rlist=[];

  rule r=new rule();

   getRule()async{
    rlist=await r.getAllRule();
    for (var e in rlist) {
      rulelist.add(e.name);
    }
    setState(() { });
   }

  String? selectedRule;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Section Entry")),
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
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
                      child: DropdownButton(
                        dropdownColor: Colors.black,
                        hint: CustomText("Select Rule", Colors.white, 18),
                        value: selectedRule,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        isDense: true,
                        isExpanded: true,
                        items: getRuleitems(),
                        onChanged: (Value) {
                          setState(() {
                            selectedRule = Value!;
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                CustomTextForm(
                    "Fine",
                    "Fine",
                    null,
                    false,
                    finectr,
                    Icon(Icons.safety_divider,
                        size: 30, color: Color.fromARGB(255, 119, 235, 253))),
                SizedBox(
                  height: 30,
                ),
                CustomButton(() async{
                 r =rlist.where((element) => element.name==selectedRule).first;
                 print("Rule ID : "+r.id.toString());
                  String url='${ip}/add_fine';
                    var request =http.MultipartRequest('POST',Uri.parse(url));
                    request.fields['org_id']=widget.ulist[0].org_id.toString();
                    request.fields['rule_id']=r.id.toString();
                    request.fields['fine']=finectr.text;
                    var response=await request.send();
                  
        if(response.statusCode==200)
        {
          print("Fine Added!");
        }
                  setState(() {
                    
                  });
                }, "Save", 18.0, 40, 15),
                SizedBox(
                  height: 15,
                ),



FutureBuilder<List<RuleFine>>(
  future: rf.getAllFine(widget.ulist[0].org_id),
  builder: (BuildContext context, AsyncSnapshot<List<RuleFine>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.data!=null && snapshot.data!.isEmpty) {
      
        return const Center(child: Text("NO RECORD FOUND",style: TextStyle(fontSize: 25,color: Colors.white),),);
        
      }else if(snapshot.data!=null){
       rflist=snapshot.data!;
       print("HERE ----"+rflist.length.toString());
      return SingleChildScrollView(
                    child: Container(
                        height: 600,
                        child: ListView.builder(
                            itemCount: rflist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  elevation: 20,
                                  child: ListTile(
                                    subtitle: CustomText(
                                        rflist[index].fine.toString(),
                                        Colors.black,
                                        18),
                                    title: CustomText(rflist[index].rulename.toString(),
                                        Colors.black, 18),
                                    trailing:
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              )),
                                  ));
                            })));
      }else{
        //print("NUMBER OF OBJ :"+rflist.length.toString());
         return const Center(child: Text("Network Problem Please Try Again",style: TextStyle(fontSize: 20,color: Colors.white),),);
        }
    },
),



                SingleChildScrollView(
                    child: Container(
                        height: 600,
                        child: ListView.builder(
                            itemCount: flist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  elevation: 20,
                                  child: ListTile(
                                    subtitle: CustomText(
                                        flist[index].toString(),
                                        Colors.black,
                                        18),
                                    title: CustomText(selectedRule.toString(),
                                        Colors.black, 18),
                                    trailing: Container(
                                      width: 100,
                                      height: 30,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  flist.removeAt(index);
                                                });
                                              },
                                              icon: Icon(Icons.delete,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ),
                                  ));
                            }))),
              ],
            ),
          ),
        ));
  }
}
