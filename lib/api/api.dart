import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class User
{
  late String name,email,password,role;
  String? img;
  late int org_id,section_id;
  User();
  User.fromMap(Map<String,dynamic> map)
  {
    email=map["email"];
    name=map["name"];
    password=map["password"];
    role=map["role"];
    img=map["image"];
    org_id=map["org_id"];
    section_id=map["section_id"];
  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'email':email,
      'password':password,
      'role':role
    };

  }

  
  
  // Future<String?> signupMutliPart()async{
  //   String url='${ip}/add_user';
  //     var request   = http.MultipartRequest('POST',Uri.parse(url));
  //     request.fields['name']=name;
  //     request.fields['email']=email;
  //     request.fields['password']=password;
  //     request.fields['role']=role;
  //     request.fields['org_id']=org_id.toString();
  //     request.fields['section_id']=section_id.toString();
  // //         http.MultipartFile newfile=await http.MultipartFile.fromPath('image',f!.path);
  // //  request.files.add(newfile);
  //       var response=await request.send();
  //       if(response.statusCode==200)
  //       return response.stream.bytesToString();
  //       return null;
  // }

  // Future<String?> EmployeesignupMutliPart(List<XFile> f)async{
  //   String url='${ip}/add_user';
  //     var request   = http.MultipartRequest('POST',Uri.parse(url));
  //     request.fields['name']=name;
  //     request.fields['email']=email;
  //     request.fields['password']=password;
  //     request.fields['role']=role;
  //     request.fields['org_id']=org_id.toString();
  //     request.fields['section_id']=section_id.toString();

  //     for (var e in f) {
        
  //     var stream = new http.ByteStream(e.openRead());
  //     var length = await e.length();
  //     var multipartFile = new http.MultipartFile('image', stream, length,
  //     filename: path.basename(e.path));
  //     request.files.add(multipartFile);

  //     }
  //   var response = await request.send();
  //   if(response.statusCode==200){
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });}else{
  //               return null;
  //   }
    
  // }


}










