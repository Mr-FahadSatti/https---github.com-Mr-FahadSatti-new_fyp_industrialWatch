import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../api/ipaddress.dart';
import '../../customs/customTextField.dart';
import '../../customs/custumbutton.dart';
import '../../model/users.dart';
import '../signin.dart';
import 'meterScreen.dart';
import 'meter_model.dart';
import 'package:http/http.dart' as http;

class AddMeter extends StatefulWidget {
  List<Users> ulist=[];
  AddMeter(this.ulist);


  //const AddMeter({Key? key}) : super(key: key);

  @override
  State<AddMeter> createState() => _AddMeterState();
}

class _AddMeterState extends State<AddMeter> {


  Meter m= new Meter();
  List<Meter>mlist=[];

  late int orgid;
  late int meterid;
  late int user_id;
  void initState() {
    super.initState();
    for(int i=0; i<widget.ulist.length; i++)
      {
        print("ULiist----------------${widget.ulist[i].org_id}");
      }
    orgid = widget.ulist[0].org_id;

    //print("ULiist----------------${widget.ulist.length}");
    user_id=widget.ulist[0].id;
    //print("here:-------------"+orgid);
    print("User id:${user_id}");
  }
  TextEditingController metername = TextEditingController();
  TextEditingController meterunit = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController from = TextEditingController();
  String? response;
   String? gval;
   SignIn s=new SignIn();

  //  Meter met=new Meter();
  // List<String> mtypelist=[];
  // List<String> munitlist=[];

  Container getimage() {
    return Container(
      height: 200, width: 400,
      child: Image.asset('assets/images/240_F_510678477_CRry9lcflotiURTM5Vejp6nlBkwBJ11t-removebg-preview.png',
        fit: BoxFit.fill,),
    );
  }


  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:
      Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Add Meter',style: TextStyle(color: Colors.black),),),
          body:SingleChildScrollView(
            child:
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color.fromARGB(255, 9, 35, 118),
            //         Color.fromARGB(255, 5, 69, 4),
            //         Color.fromARGB(255, 15, 5, 5)
            //       ]
            //     )
            //   ),
            //   child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                      getimage(),
                    SizedBox(height: 0,),
                    CustomTextForm('Meter Name', 'Meter Name', null, false, metername,Icon(Icons.gas_meter)),
                    SizedBox(height: 10,),
                    CustomTextForm('Meter Unit', 'Meter Unit', null, false, meterunit,Icon(Icons.ac_unit_outlined)),
                    SizedBox(height: 20,),
                    // Container(
                    //   height: 160,width: 250,
                    //   child: InputDecorator(
                    //     decoration: const InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.white),
                    //       ),
                    //       labelText: ("Type"),
                    //       labelStyle: TextStyle(fontSize: 25,color: Colors.white70),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         SizedBox(height: 1,),
                    //         RadioListTile(
                    //             title: Text("Analog",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.white),),
                    //             value: 'Analog', groupValue: gval, onChanged: (Object? o){
                    //           setState(() {
                    //             gval=o.toString();
                    //           });
                    //         }),
                    //         SizedBox(height: 5,),
                    //         RadioListTile(
                    //             title: Text("Digital",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.white),),
                    //             value: 'Digital', groupValue: gval, onChanged: (Object? o){
                    //           setState(() {
                    //             gval=o.toString();
                    //           });
                    //         })
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // Container(
                    //   height: 160,width: 250,
                    //   child: InputDecorator(
                    //     decoration: const InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.white),
                    //       ),
                    //       labelText: ("Reading Range"),
                    //       labelStyle: TextStyle(fontSize: 25,color: Colors.white),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         TextFormField(
                    //           style: TextStyle(fontSize: 15),
                    //           decoration: InputDecoration(hintText: "To",hintStyle: TextStyle(color: Colors.white60)),                              controller: to,
                    //         ),
                    //         SizedBox(height: 5,),
                    //         TextFormField(
                    //           style: TextStyle(fontSize: 15),
                    //           decoration: InputDecoration(hintText: "From",hintStyle: TextStyle(color: Colors.white60)),
                    //           controller: from,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),


                    SizedBox(height: 10,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    CustomButton(() async{
                      if(meterunit.text!="" && metername.text!="")
                        {
                          print("entered in if");
                          m.org_id= widget.ulist[0].org_id;
                          m.meter_name= metername.text;
                          m.meter_unit= meterunit.text;
                          //m.meter_type= gval.toString();
                          response= await m.AddMeterMultipart(m);
                          print("addding meter responce : "+response!);
                          Fluttertoast.showToast(
                              msg: response.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              backgroundColor: Colors.black87,
                              fontSize: 18.0);
                          setState(() {});
                        }
                      else
                            {
                              Fluttertoast.showToast(
                                  msg: "Plz fill the required fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.red,
                                  fontSize: 19.0);
                            }
                    },'Add',20,20,20),
                    SizedBox(width: 10,),
                    CustomButton( (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Metercreen(widget.ulist)),);
                    },'Test',20,20,20),]),
                    SizedBox(height: 10,),
                   SingleChildScrollView(child: Container(
                     height: 300,width: 350,
                      child: Card(
                       color: Colors.grey,
                       child:

                       FutureBuilder<List<Meter>>(
                         future: m.getAllMeter(widget.ulist[0].org_id),
                         builder: (BuildContext context, AsyncSnapshot<List<Meter>> snapshot) {
                           if (snapshot.connectionState == ConnectionState.waiting) {
                             return const Center(child: CircularProgressIndicator());
                           } else if (snapshot.data!=null && snapshot.data!.isEmpty) {

                             return const Center(child: Text("NO RECORD FOUND",style: TextStyle(fontSize: 25,color: Colors.white),),);

                           }else if(snapshot.data!=null && snapshot.data!.isNotEmpty){
                             mlist=snapshot.data!;
                             print("HERE ----"+mlist.length.toString());
                             return Container(
                                 //height: 100,
                                 //width: 200,
                                 child: ListView.builder(
                                     itemCount: mlist.length,
                                     itemBuilder: (context, index) {
                                       return Card(
                                           elevation: 10,
                                           shape: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(10)),
                                           child: ListTile(
                                             title: Text(mlist[index].meter_name.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                             subtitle: Text("Unit : "+mlist[index].meter_unit.toString(),style: TextStyle(fontSize: 18,color: Colors.red),),
                                             //leading: Text(mlist[index].id.toString()),
                                             trailing:
                                             IconButton(
                                                 onPressed: () async{
                                                   String url = '${ip}/delete_meter';
                                                   print("1111111111111111111111111111111");
                                                   var request = http.MultipartRequest('DELETE', Uri.parse(url));
                                                   //print("org id............"+int.parse(orgid).toString());
                                                   print("2222222222222222222222222");
                                                   request.fields["org_id"] = widget.ulist[0].org_id.toString();
                                                   print("33333333333333333333");
                                                   request.fields["id"] =mlist[index].id.toString();
                                                   print(widget.ulist[0].org_id.toString());
                                                   print(mlist[index].id.toString());
                                                   var response = await request.send();
                                                   print("44444444444444444444");
                                                   String res=await response.stream.bytesToString();
                                                   print(res);
                                                   if(response.statusCode==200){
                                                     print("5555555555555555555");
                                                     Fluttertoast.showToast(
                                                         msg: "Deleted Successfully",
                                                         toastLength: Toast.LENGTH_SHORT,
                                                         gravity: ToastGravity.BOTTOM,
                                                         timeInSecForIosWeb: 1,
                                                         textColor: Colors.white,
                                                         fontSize: 18.0
                                                     );
                                                   }
                                                   else{
                                                     Fluttertoast.showToast(
                                                         msg: "Error: Item cant delete",
                                                         toastLength: Toast.LENGTH_SHORT,
                                                         gravity: ToastGravity.BOTTOM,
                                                         timeInSecForIosWeb: 1,
                                                         textColor: Colors.red,
                                                         fontSize: 16.0);
                                                   }
                                                   setState(() {

                                                   });
                                                 },
                                                 icon: const Icon(Icons.delete_forever_rounded),iconSize: 30,color: Colors.red,),
                                           ));
                                     }));
                           }else{
                             return const Center(child: Text("Network Problem Please Try Again",style: TextStyle(fontSize: 20,color: Colors.white),),);
                           }
                         },
                       ),
                   ),
                    ),),
                  ],
                ),),
           // ),
          ),
    ),
      );

  }
}
