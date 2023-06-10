import 'dart:convert';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../api/ipaddress.dart';
class RuleFine{

late int fid,org_id,fine;
late String rulename;

RuleFine();
RuleFine.fromMap(Map<String,dynamic> mp){
fid=mp["fid"];
rulename=mp["name"];
fine=mp["fine"];
org_id=mp["org_id"];
}

 Future<List<RuleFine>> getAllFine(int oid)async{
    String urll='${ip}/get_productivity_fine_rule';
                    var req =http.MultipartRequest('GET',Uri.parse(urll));
                    req.fields["org_id"]=oid.toString();
                    var resp=await req.send();
                    print("REQUest Send");
                    String result = await resp.stream.bytesToString();
                    print(result);
                    if(resp.statusCode==200){
                      print("2000000000000000000000000");
                      List jsonlst = jsonDecode(result);
                      return jsonlst.map((e) => RuleFine.fromMap(e)).toList();
                    }else{
                      return [];
                    }
              
                   
  }

}