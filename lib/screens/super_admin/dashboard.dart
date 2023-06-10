import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../customs/customtext.dart';
import '../../model/users.dart';
import '../supervisor/employee_productivity/employee_data.dart';
import '../supervisor/employee_productivity/productivity_voilation_record.dart';
import 'add_admin.dart';
import 'add_org.dart';
import 'add_productivity_rule.dart';
import 'add_safety_rule.dart';

class SuperAdminDashboard extends StatefulWidget {
  //const SuperAdminDashboard({super.key});
  List<Users> ulist=[];
  SuperAdminDashboard(this.ulist);

  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "SuperAdmin Dashboard",
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
            child: Column(children: [
              CustomText("Welcome Mr.${widget.ulist[0].name}", Colors.white, 30),
              SizedBox(
                height: 40,
              ),
              
             
              
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddOrg();
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
                                "Add Organization",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddAdmin();
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
                                height: 20,
                              ),
                              Icon(
                                Icons.person_add,
                                size: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Add Admin",
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
                          Row(
                children: [
                  GestureDetector(
                    onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddSafetyRule();
                }));},
                    child: Card(
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
                            "Add Safety Rule",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ]),
                      ))),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddProductivityRule();
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
                                "Add Productivity Rule",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ))),
                ],
              ),

              
            ]),
          ),
        ));
  }
}
