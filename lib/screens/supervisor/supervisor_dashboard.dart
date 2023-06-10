import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../customs/customtext.dart';
import '../../customs/custumbutton.dart';
import '../../model/users.dart';
import '../ReadingAnalogDisplay/addMeter.dart';
import '../ReadingAnalogDisplay/allRecord.dart';
import '../ReadingAnalogDisplay/meterScreen.dart';
import 'employee_productivity/employee_data.dart';
import 'employee_productivity/productivity_voilation_record.dart';

class SupervisorDashboard extends StatefulWidget {
  //const SupervisorDashboard({super.key});
  List<Users> ulist=[];
  SupervisorDashboard(this.ulist);

  @override
  State<SupervisorDashboard> createState() => _SupervisorDashboardState();
}

class _SupervisorDashboardState extends State<SupervisorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Supervisor Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(children: [
              CustomText("WelCome Mr. ${widget.ulist[0].name}", Colors.white, 30),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 20,
                      child: Container(
                        height: 150,
                        width: 130,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/safe.png',
                            scale: 2.5,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Employee Safety",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ]),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EmployeeData();
                }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(
                                children: [
                              SizedBox(
                                height: 15,
                              ),
                              Image.asset(
                                'assets/images/pp.png',
                                scale: 3.5,
                                //fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Employe Productivity",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                 // width: ,
                ),
                CustomButton(() {}, "See Records", 20, 10, 10),
                SizedBox(
                  width: 48,
                ),
                CustomButton(() {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductivityVoilationRecord();
                }));}, "See Records", 20, 10, 10),
              ]),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/images/depart.jpg',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Productivity Analysis",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ]),

                            // child: Center(
                            //     child: Text(
                            //   "New Department",
                            //   style: TextStyle(fontSize: 15),
                            // )),
                          ))),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 51,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Metercreen(widget.ulist)));
                                            },child: Container(
                                               height: 140,
                                               width: 130,
                                             child: Column(children: [
                                               SizedBox(height: 15,),
                                              Image.asset('assets/images/analog (480).jpg',scale: 2.5,fit: BoxFit.fill,),

                                              Text('Take Reading',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),),

                                        ]),),
                                      ))
                            ]),

                          ))),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SizedBox(
                  width: 4,
                ),
                CustomButton(() {}, "See Records", 20, 10, 10),
                SizedBox(
                  width: 52,
                ),
                CustomButton(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>My_meter_data(widget.ulist)));
                }, "See Records", 20, 10, 10),
              ]),
            ]),
          ),
        ));
  }
}
