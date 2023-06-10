import 'package:flutter/material.dart';

import '../../model/users.dart';
import 'add_employee.dart';
import 'add_supervisor.dart';

class HomeAddEmployee extends StatefulWidget {
  List<Users> ulist=[];
  HomeAddEmployee(this.ulist);

  @override
  State<HomeAddEmployee> createState() => _HomeAddEmployeeState();
}

class _HomeAddEmployeeState extends State<HomeAddEmployee> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: "Add Employee"), Tab(text: "Add Supervisor")],
          ),
        ),
        body: TabBarView(
          children: [
            AddEmployee(widget.ulist),
            AddSupervisor(widget.ulist),
          ],
        ),
      ),
    );
  }
}
