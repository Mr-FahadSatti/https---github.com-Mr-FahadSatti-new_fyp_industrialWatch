import 'package:flutter/material.dart';

import '../../../customs/customtext.dart';

class ProductivityVoilationRecord extends StatefulWidget {
  @override
  _ProductivityVoilationRecord createState() => _ProductivityVoilationRecord();
}

class _ProductivityVoilationRecord extends State<ProductivityVoilationRecord> {
  List<DataRow> getrows() {
    List<DataRow> drlist = [];
    DataRow obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    obj = DataRow(cells: getcells());
    drlist.add(obj);
    return drlist;
  }

  List<DataCell> getcells() {
    List<DataCell> dclist = [];
    //Below we Write for Loop
    DataCell obj = DataCell(
        Container(width: 80, child: CustomText('101', Colors.white, 13)));
    dclist.add(obj);
    obj = DataCell(
        Container(width: 80, child: CustomText('Qamar', Colors.white, 13)));
    dclist.add(obj);
    obj = DataCell(Container(
        width: 80, child: CustomText('Using Phone', Colors.white, 13)));
    dclist.add(obj);
    obj = DataCell(
        Container(width: 60, child: CustomText('Rs-200', Colors.white, 15)));
    dclist.add(obj);
    obj = DataCell(
        Container(width: 60, child: CustomText('4/2/2023', Colors.white, 13)));
    dclist.add(obj);
    obj = DataCell(
        Container(width: 60, child: CustomText('04:50 PM', Colors.white, 13)));
    dclist.add(obj);
    return dclist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
              'Record of Productivity Voilation', Colors.black, 18.0),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: 600,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                DataTable(columns: [
                  DataColumn(
                      label: Text('Emp ID',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                  DataColumn(
                      label: Text('Emp Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                  DataColumn(
                      label: Text('Voilation',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                  DataColumn(
                      label: Text('Fine',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                  DataColumn(
                      label: Text('Time',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 119, 235, 253)))),
                ], rows: getrows()
                    //[
                    //   DataRow(cells: [
                    //     DataCell(Text('Using Phone')),
                    //     DataCell(Text('Rs-200')),
                    //     DataCell(Text('5/1/2023')),
                    //     DataCell(Text('3:37 PM'))
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Using Phone')),
                    //     DataCell(Text('Rs-200')),
                    //     DataCell(Text('5/1/2023')),
                    //     DataCell(Text('3:37 PM'))
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Using Phone')),
                    //     DataCell(Text('Rs-200')),
                    //     DataCell(Text('5/1/2023')),
                    //     DataCell(Text('3:37 PM'))
                    //   ]),
                    //   DataRow(cells: [
                    //     DataCell(Text('Using Phone')),
                    //     DataCell(Text('Rs-200')),
                    //     DataCell(Text('5/1/2023')),
                    //     DataCell(Text('3:37 PM'))
                    //   ]),
                    // ],
                    ),
              ])),
        ));
  }
}
