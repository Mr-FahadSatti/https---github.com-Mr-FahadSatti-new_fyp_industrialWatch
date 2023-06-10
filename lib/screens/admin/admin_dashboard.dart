import 'package:flutter/material.dart';
import 'package:new_fyp_femo/screens/admin/section_entry.dart';

import '../../customs/customtext.dart';
import '../../model/users.dart';
import '../ReadingAnalogDisplay/addMeter.dart';
import 'employee_productivity/home_productivity.dart';
import 'home_add_employee.dart';

class AdminDashboard extends StatefulWidget {

  List<Users> ulist=[];

  AdminDashboard(this.ulist);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),//Color(0xFF614385),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Admin Dashboard",
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
            padding: const EdgeInsets.all(25.0),
            child:
            Column(children: [
              CustomText("Welcome Mr.${widget.ulist[0].name}", Colors.white, 30),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Section_Entry(widget.ulist);
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
                                "Add Department",
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
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeAddEmployee(widget.ulist);
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
                              SizedBox(
                                height:10,
                              ),
                              Icon(
                                Icons.person_add,
                                size: 105,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Add Employee ",
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
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
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

                        // child: Center(
                        //     child: Text(
                        //   "New Department",
                        //   style: TextStyle(fontSize: 15),
                        // )),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeProductivity(widget.ulist);
                        }));
                      },
                      child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          elevation: 20,
                          child: Container(
                            height: 150,
                            width: 130,
                            child: Column(children: [
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
                                    fontSize: 14.5, fontWeight: FontWeight.bold),
                              )
                            ]),

                            // child: Center(
                            //     child: Text(
                            //   "New Department",
                            //   style: TextStyle(fontSize: 15),
                            // )),
                          ))),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
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
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 20,
                      child: Container(
                        height: 150,
                        width: 130,
                        child: Column(children: [

                          GestureDetector(
                              onTap: () {},
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMeter(widget.ulist)));
                                    },
                                  child:
                                  Container(
                                    height: 150,
                                    width: 130,
                                    child: Column(children: [
                                      SizedBox(height: 10,),
                                      Image.asset('assets/images/analog (480).jpg',scale: 2.5,fit: BoxFit.fill,),
                                      Text('Add Meter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),)
                                    ]),
                                  )),),
                        ]),

                        // child: Center(
                        //     child: Text(
                        //   "New Department",
                        //   style: TextStyle(fontSize: 15),
                        // )),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
