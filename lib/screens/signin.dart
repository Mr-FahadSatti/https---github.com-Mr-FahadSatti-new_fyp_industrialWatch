
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_fyp_femo/screens/super_admin/dashboard.dart';
import 'package:new_fyp_femo/screens/supervisor/supervisor_dashboard.dart';

import '../customs/customTextField.dart';
import '../customs/custumbutton.dart';
import '../model/users.dart';
import 'admin/admin_dashboard.dart';
import 'employee/employee_voilation_record.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController unamectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  List<String> rollist = ["SuperAdmin","Admin", "Supervisor", "Employee"];
  

  List<DropdownMenuItem<String>> getRolitems() {
    List<DropdownMenuItem<String>> rolitems = [];
    for (var e in rollist) {
      DropdownMenuItem<String> obj =
          DropdownMenuItem<String>(value: e, child: Text(e));
      rolitems.add(obj);
    }
    return rolitems;
  }

  String? selectedOrg;
  String? selectedRol;
  bool? _passwordVisible = true;
  bool _obscureText = true;
  TextEditingController pass = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  Users u= new Users();
  List<Users> ulist=[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 900,
                  width: 400,
                  // color: Color(0xFF868b82),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                        colors: [Color.fromARGB(255, 0, 53, 103), Color.fromARGB(255, 0, 53, 103)],
                      //colors: [Color(0xFF614385), Color(0xFF516395)],
                    ),
                  ),
                ),
                Positioned(
                  top: 165,
                  right: 18,
                  left: 18,

                  child: Container(
                    height: 500,
                    width: 300,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      border: Border.all(
                          color: Colors.white60
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children:  [
                        const SizedBox(height: 10,),
                        Container(
                          height: 170,
                          width: 140,
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Color.fromARGB(255, 0, 53, 103),
                            child: Image.asset('assets/images/watchs.png'),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: TextFormField(
                            controller: emailctr,
                            style: const TextStyle(fontSize: 22),
                            decoration:  InputDecoration(
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.black26)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Color(0xFF24273a))),
                              hintText: "Email",
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black,fontFamily: 'MarckScript',),
                              prefixIcon: Icon(Icons.email,color: Colors.black,),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 22),
                            obscureText: _obscureText,
                            obscuringCharacter: "*",
                            controller: pass,
                            decoration:  InputDecoration(
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.black26)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Color(0xFF24273a))),
                              hintText: "Password",
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.black,fontFamily: 'MarckScript',),
                              prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText=!_obscureText;
                                    });
                                  },
                                  child:  Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.black,)),

                            ),
                          ),
                        ),
                        const SizedBox(height: 18,),
                       ElevatedButton(onPressed: ()async{
                         ulist = await u.Login(emailctr.text, pass.text);
                         if(ulist.isNotEmpty){
                           //
                           //   String email=ulist[0].email;
                           //   String pasword=ulist[0].password;
                           //   String name=ulist[0].name;
                           //   String role=ulist[0].role;
                           //   int id=ulist[0].id;
                           //   int org_id=ulist[0].org_id;
                           //   final prefs=await SharedPreferences.getInstance();
                           //   prefs.setString("email", email);
                           //   prefs.setString("pasword", pasword);
                           //   prefs.setString('name', name);
                           //   prefs.setString('role', role);
                           //   prefs.setBool("isLogin", true);
                           //   prefs.setInt('id', id);
                           //   prefs.setInt('org_id', org_id);

                           print("ROLE"+ulist[0].role);
                           if (ulist[0].role == "admin" || ulist[0].role == "Admin") {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) {
                                   return AdminDashboard(ulist);
                                 }));
                           } else if (ulist[0].role.contains("superv") || ulist[0].role.contains("Supervi") ) {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) {
                                   return SupervisorDashboard(ulist);
                                 }));
                           }else if (ulist[0].role == "superadmin" || ulist[0].role == "Superadmin") {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) {
                                   return SuperAdminDashboard(ulist);
                                 }));
                           }else if (ulist[0].role== "employee" || ulist[0].role== "Employee") {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) {
                                   return EmployeeVoilationRecord();
                                 }));
                           }
                           else{
                             Fluttertoast.showToast(
                                 msg: "Incorrect Email or Password",
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.BOTTOM,
                                 timeInSecForIosWeb: 1,
                                 textColor: Colors.white,
                                 fontSize: 16.0);
                           }}},
                         style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                         backgroundColor: Color.fromARGB(255, 0, 53, 103),
                         padding: const EdgeInsets.all(16),),
                        child: const Text('Sign In',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                         ),)),
                          ],
                        ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
