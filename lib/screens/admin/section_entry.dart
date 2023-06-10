import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../api/ipaddress.dart';
import '../../customs/customTextField.dart';
import '../../customs/custumbutton.dart';
import '../../model/section.dart';
import '../../model/users.dart';

class Section_Entry extends StatefulWidget {
  List<Users> ulist=[];
  Section_Entry(this.ulist);

  @override
  State<Section_Entry> createState() => _Section_EntryState();
}

class _Section_EntryState extends State<Section_Entry> {
  TextEditingController sectionctr = TextEditingController();
  Section s=new Section();
  List<Section> slist=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Section Entry",
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomTextForm(
                    "Section Name",
                    "Section",
                    null,
                    false,
                    sectionctr,
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
                    String url='${ip}/add_section';
                    var req=http.MultipartRequest('POST',Uri.parse(url));
                    req.fields['org_id']=widget.ulist[0].org_id.toString();
                    req.fields["name"]=sectionctr.text;
                    var response=await req.send();
                    if(response.statusCode==200){
                      print("Save");
                    }
                    setState(() { });
                  }, "Save", 18.0, 40, 20),
                ]),
                SizedBox(
                  height: 30,
                ),


                FutureBuilder<List<Section>>(
                  future: s.getAllSec(widget.ulist[0].org_id),
                  builder: (BuildContext context, AsyncSnapshot<List<Section>> snapshot) {
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
                                      trailing:
                                             IconButton(
                                                 onPressed: () {},
                                                 icon: const Icon(Icons.edit)),
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
