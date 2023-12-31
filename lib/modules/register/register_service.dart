import 'dart:convert';

import 'package:pharmacy_app/config/server_config.dart';
import 'package:pharmacy_app/models/user.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  var message;
  var url = Uri.parse(ServerConfiguration.domainNameServer + ServerConfiguration.register);

  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        'full_name': user.userName,
        'phone': user.phoneNumber,
        'password': user.password,
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse=jsonDecode(response.body);
      message='Register Successfully';
      print(jsonResponse['success']);
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse=jsonDecode(response.body);
      message=jsonResponse['message'];
      print(jsonResponse['']);
      return false;
    }else if (response.statusCode==401){
      var jsonResponse=jsonDecode(response.body);
      message=jsonResponse['message'];
      print(jsonResponse['']);
      return false;
    }else {
      return false;
    }
  }
}
