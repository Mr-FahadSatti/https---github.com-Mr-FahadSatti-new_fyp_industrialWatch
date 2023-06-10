import 'dart:convert';
import '../../../api/ipaddress.dart';
import 'package:http/http.dart' as http;

class Section{
  late int sid;
  late String name;

  Section();
  Section.fromMap(Map<String,dynamic> mp){
    sid=mp["id"];
    name=mp["name"];
  }



  Future<List<Section>> getAllSec(int oid)async{
    String urll='${ip}/get_section';
    var req =http.MultipartRequest('GET',Uri.parse(urll));
    req.fields["org_id"]=oid.toString();
    var resp=await req.send();
    String result = await resp.stream.bytesToString();
    print(result);
    if(resp.statusCode==200){
      print("2000000000000000000000000");
      List jsonlst = jsonDecode(result);
      return jsonlst.map((e) => Section.fromMap(e)).toList();
    }else{
      return [];
    }
  }
}
