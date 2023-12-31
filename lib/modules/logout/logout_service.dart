
import 'dart:convert';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;
class LogoutService {
  var message;
  var url = Uri.parse(ServerConfiguration.domainNameServer + ServerConfiguration.logout);

  Future<bool> logout(String? token) async {
    var response = await http.get(
      url,
      headers: {"Accept": "application/json", 'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);

    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      message =jsonResponse['message'];
      return true;
    }else if(response.statusCode==401){
      var jsonResponse=jsonDecode(response.body);
      message =jsonResponse['message'];
      return false;
    }else{
      return false;
    }
  }
}