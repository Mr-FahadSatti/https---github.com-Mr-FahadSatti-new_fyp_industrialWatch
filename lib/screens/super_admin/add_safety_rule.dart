import 'package:flutter/material.dart';

import '../../customs/customTextField.dart';
import '../../customs/custumbutton.dart';

class AddSafetyRule extends StatefulWidget {
  const AddSafetyRule({super.key});

  @override
  State<AddSafetyRule> createState() => _AddSafetyRuleState();
}

class _AddSafetyRuleState extends State<AddSafetyRule> {
  TextEditingController sectionctr = TextEditingController();
  List<String> slist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Add Safety Rule",
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
                    "Rule Name",
                    "Name",
                    null,
                    false,
                    sectionctr,
                    Icon(
                      Icons.safety_divider,
                      color: Color.fromARGB(255, 119, 235, 253),
                      size: 35,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(
                    width: 200,
                  ),
                  CustomButton(() {
                    setState(() {
                      slist.add(sectionctr.text);
                    });
                  }, "Save", 18.0, 40, 20),
                ]),
                SizedBox(
                  height: 30,
                ),
                Container(
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
                                title: Text(slist[index].toString()),
                                trailing: Container(
                                  width: 100,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ));
                        })),
              ],
            ),
          ),
        ));
  }
}
