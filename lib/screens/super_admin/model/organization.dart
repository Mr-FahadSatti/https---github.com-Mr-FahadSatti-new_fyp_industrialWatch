import 'dart:convert';

import '../../../api/ipaddress.dart';
import 'package:http/http.dart' as http;
class Organization{
  late int oid;
  late String name;

  Organization();
  Organization.fromMap(Map<String,dynamic> mp){
    oid=mp["oid"];
    name=mp["name"];
  }



  Future<List<Organization>> getAllOrg()async{
    String urll='${ip}/get_all_org';
    var req =http.MultipartRequest('GET',Uri.parse(urll));
    var resp=await req.send();
    String result = await resp.stream.bytesToString();
    print(result);
    if(resp.statusCode==200){
      print("2000000000000000000000000");
      List jsonlst = jsonDecode(result);
      return jsonlst.map((e) => Organization.fromMap(e)).toList();
    }else{
      return [];
    }
  }
  }
