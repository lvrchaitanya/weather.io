
import 'dart:convert';
import 'package:http/http.dart';

class Networking{

  String url;

     Networking({this.url});
   Future getloc() async {
     Response response = await get(url);

     if(response.statusCode==200) {
       var data = response.body;
       return jsonDecode(data);
     }
     else
       print('error');


   }
}