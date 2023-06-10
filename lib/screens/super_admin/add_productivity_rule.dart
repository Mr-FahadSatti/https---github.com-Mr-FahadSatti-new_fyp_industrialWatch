import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../api/ipaddress.dart';
import '../../customs/customTextField.dart';
import '../../customs/custumbutton.dart';
import 'model/productivity_rule.dart';

class AddProductivityRule extends StatefulWidget {
  const AddProductivityRule({super.key});

  @override
  State<AddProductivityRule> createState() => _AddProductivityRuleState();
}

class _AddProductivityRuleState extends State<AddProductivityRule> {
  
  TextEditingController rulectr = TextEditingController();
  List<rule> slist = [];
   rule r=new rule();
  void initState() {
    //getdata();
  }
  getdata()async{
   
    slist=await r.getAllRule();
    //await Future.delayed(Duration(seconds: 3));
    print("Total Length : "+slist.length.toString());
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Add Productivity Rule",
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextForm(
                    "Rule Name",
                    "Name",
                    null,
                    false,
                    rulectr,
                    const Icon(
                      Icons.safety_divider,
                      color: Color.fromARGB(255, 119, 235, 253),
                      size: 35,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  const SizedBox(
                    width: 200,
                  ),
                  CustomButton(() async{
                    String url='${ip}/add_rule';
                    var request =http.MultipartRequest('POST',Uri.parse(url));
                    request.fields['name']=rulectr.text;
                    request.fields['rule_type']=1.toString();
                    var response=await request.send();
                  
        if(response.statusCode==200)
        {
          print("Rule Added!");
        }

        //slist=await r.getAllRule();
                    //await Future.delayed(Duration(seconds: 3));
                    setState(() {
                      
                    });


                  }, "Save", 18.0, 40, 20),
                ]),
                const SizedBox(
                  height: 30,
                ),

                        FutureBuilder<List<rule>>(
  future: r.getAllRule(),
  builder: (BuildContext context, AsyncSnapshot<List<rule>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.data!=null && snapshot.data!.isEmpty) {
      
        return const Center(child: Text("NO RECORD FOUND",style: TextStyle(fontSize: 25,color: Colors.white),),);
        
      }else if(snapshot.data!=null && snapshot.data!.isNotEmpty){
       slist=snapshot.data!;
       print("HERE ----"+slist.length.toString());
      return Container(
                    height: 600,
                    //width: 200,
                    child: ListView.builder(
                        itemCount: slist.length,
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 20,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text(slist[index].name.toString()),
                                trailing: Container(
                                  width: 100,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      // IconButton(
                                      //     onPressed: () {},
                                      //     icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: ()async{
                                             String url='${ip}/delete_rule';
                    var request =http.MultipartRequest('DELETE',Uri.parse(url));
                    request.fields['name']=slist[index].name;
                    
                    var response=await request.send();
                  
        if(response.statusCode==200)
        {
          print("Deleted Rule");
        } 

        //slist=await r.getAllRule();
                    setState(() {
                      
                    });
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ));
                        }));
      }else{
         return const Center(child: Text("Network Problem Please Try Again",style: TextStyle(fontSize: 20,color: Colors.white),),);
        }
    },
),

                        
              ],
            ),
          ),
        ));
  }
}
