import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../api/ipaddress.dart';
class rule{
late String name;
late int id;

rule();
rule.fromMap(Map<String,dynamic> mp){
id=mp["id"];
name=mp["name"];
}

 Future<List<rule>> getAllRule()async{
    String urll='${ip}/get_all_rule';
                    var req =http.MultipartRequest('GET',Uri.parse(urll));
                    var resp=await req.send();
                    String result = await resp.stream.bytesToString();
                    print(result);
                    if(resp.statusCode==200){
                      print("2000000000000000000000000");
                      List jsonlst = jsonDecode(result);
                      return jsonlst.map((e) => rule.fromMap(e)).toList();
                    }else{
                      return [];
                    }
              
                   
  }

} 