import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../api/ipaddress.dart';
class Users{
late String name,email,role,password;
late int id,org_id,section_id;

Users();
Users.fromMap(Map<String,dynamic> mp){
id=mp["id"];
name=mp["name"];
email=mp["email"];
role=mp["role"];
org_id=mp["org_id"];
section_id=mp["section_id"];
}

 Future<List<Users>> Login(String email,String pass)async{
                   String urll='${ip}/login';
                    var req =http.MultipartRequest('GET',Uri.parse(urll));
                    req.fields["email"]=email;
                    req.fields["password"]=pass;
                    print(email);
                    print(pass);
                    var resp=await req.send();
                    print("REQUest Send");
                    String result = await resp.stream.bytesToString();
                    print(result);
                    if(resp.statusCode==200){
                      print("2000000000000000000000000");
                      List jsonlst = jsonDecode(result);
                      return jsonlst.map((e) => Users.fromMap(e)).toList();
                    }else{
                      return [];
                    }
              
                   
  }

  Future<String?> signupMutliPart()async{
    String url='${ip}/add_user';
      var request   = http.MultipartRequest('POST',Uri.parse(url));
      request.fields['name']=name;
      request.fields['email']=email;
      request.fields['password']=password;
      request.fields['role']=role;
      request.fields['org_id']=org_id.toString();
      request.fields['section_id']=section_id.toString();
      var response=await request.send();
        if(response.statusCode==200){
          Fluttertoast.showToast(
              msg: "Successfully Save",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0
          );
          return response.stream.bytesToString();
        }
        else{
          return null;
        }
  }


    Future<String?> EmployeesignupMutliPart(List<XFile> f)async{
    String url='${ip}/add_user';
      var request   = http.MultipartRequest('POST',Uri.parse(url));
      request.fields['name']=name;
      request.fields['email']=email;
      request.fields['password']=password;
      request.fields['role']=role;
      request.fields['org_id']=org_id.toString();
      request.fields['section_id']=section_id.toString();

      for (var e in f) {
        
      var stream = new http.ByteStream(e.openRead());
      var length = await e.length();
      var multipartFile = new http.MultipartFile('image', stream, length,
      filename: path.basename(e.path));
      request.files.add(multipartFile);

      }
    var response = await request.send();
    if(response.statusCode==200){
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      Fluttertoast.showToast(
          msg: "Successfully Save",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
    }
    else{
                return null;
    }
    
  }

//   Future<bool> isLogin() async
//   {
//     final prefs= await SharedPreferences.getInstance();
//     return prefs.getBool('isLogin') ?? false;
//   }
//
//   Future<String> getRole() async
//   {
//     Users u= new Users();
//     bool islogin= await u.isLogin();
//     final prefs= await SharedPreferences.getInstance();
//     String role= prefs.getString('role').toString();
//     if(islogin)
//       {
//         return role;
//       }
//     return 'xyz';
//
//   }
//
// Future<String> getname() async
// {
//
//   final prefs= await SharedPreferences.getInstance();
//   String name= prefs.getString('name').toString();
//
//     return name;
//
// }
//
// Future<String> getemail() async
// {
//
//   final prefs= await SharedPreferences.getInstance();
//   String email= prefs.getString('email').toString();
//     return email;
//
//
// }
//
// Future<String> getpassword() async
// {
//   Users u= new Users();
//   bool islogin= await u.isLogin();
//   final prefs= await SharedPreferences.getInstance();
//   String pasword= prefs.getString('pasword').toString();
//   if(islogin)
//   {
//     return pasword;
//   }
//   return 'xyz';
//
// }
//
// Future<int> getid() async
// {
//
//   final prefs = await SharedPreferences.getInstance();
//   int? id = prefs.getInt('id');
//
//     return id!;
//
// }
//
// Future<int> getorg_id() async
// {
//   Users u = new Users();
//   bool islogin = await u.isLogin();
//   final prefs = await SharedPreferences.getInstance();
//   int? org_id = prefs.getInt('org_id');
//   if (islogin) {
//     return org_id!;
//   }
//   return -1;
// }


} 