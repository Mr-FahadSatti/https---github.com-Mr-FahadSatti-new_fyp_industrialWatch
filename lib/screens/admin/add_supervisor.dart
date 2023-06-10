import 'package:flutter/material.dart';

import '../../customs/customTextField.dart';
import '../../customs/customtext.dart';
import '../../customs/custumbutton.dart';
import '../../model/section.dart';
import '../../model/users.dart';

class AddSupervisor extends StatefulWidget {
  List<Users> ulist=[];
  AddSupervisor(this.ulist);

  @override
  State<AddSupervisor> createState() => _AddSupervisorState();
}

class _AddSupervisorState extends State<AddSupervisor> {
  String? selectedSection;
  List<String> slist = [];
  List<DropdownMenuItem<String>> getSectionitems() {
    List<DropdownMenuItem<String>> sitems = [];
    for (var e in slist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      sitems.add(obj);
    }
    return sitems;
  }

  String? selectedRol;
  bool? _passwordVisible = true;
  TextEditingController pass = TextEditingController();
  TextEditingController emailctr= TextEditingController();
  TextEditingController unamectr = TextEditingController();

  void initState() {
    getSection();
  }
  List<Section> seclist=[];

  Section s=new Section();

  getSection()async{
    seclist=await s.getAllSec(widget.ulist[0].org_id);
    for (var e in seclist) {
      slist.add(e.name);
    }
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 53, 103),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTextForm(
                  "Name",
                  "Name",
                  null,
                  false,
                  unamectr,
                  Icon(Icons.person,
                      size: 35,
                      //color: Colors.white,
                      color: Color.fromARGB(255, 119, 235, 253))),

                    SizedBox(
                height: 20,
              ),
              CustomTextForm(
                  "Email",
                  "Email",
                  null,
                  false,
                  emailctr,
                  Icon(Icons.person,
                      size: 35,
                      //color: Colors.white,
                      color: Color.fromARGB(255, 119, 235, 253))),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontSize: 20, color: Colors.white),
                controller: pass,
                keyboardType: TextInputType.text,
                obscureText: _passwordVisible!,
                obscuringCharacter: "*",
                //validator: (pass) => pass!.length < 6 ? 'Password too short.' : null,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 2, color: Colors.white)),
                    prefixIcon: Icon(
                      Icons.lock,
                      //color: Colors.white,
                      color: Color.fromARGB(255, 119, 235, 253),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible!
                            ? Icons.visibility_off
                            : Icons.visibility,
                        //color: Colors.white,
                        color: Color.fromARGB(255, 119, 235, 253),
                        //color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible!;
                        });
                      },
                    ),
                    hintText: "Enter Password",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                    child: Theme(
                  data: Theme.of(context).copyWith(
                      //canvasColor: Color.fromARGB(255, 119, 235, 253),
                      canvasColor: Colors.black),
                  child: DropdownButton(
                    hint: CustomText("Select Section", Colors.white, 18),
                    value: selectedSection,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    isDense: true,
                    isExpanded: true,
                    items: getSectionitems(),
                    onChanged: (Value) {
                      setState(() {
                        selectedSection = Value!;
                      });
                    },
                  ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(()async{
               Users u=Users();
              u.role="supervisor";
              u.email=emailctr.text;
              u.password=pass.text;
              u.name=unamectr.text;
              var sec=seclist.where((element) => element.name==selectedSection).first;
              u.section_id=sec.sid;
              u.org_id=widget.ulist[0].org_id;
             var response=await u.signupMutliPart();

    
             setState(() {
               
             });

            }, "Save", 22.0, 120, 13),
            ],
          ),
        )));
  }
}
