import 'dart:convert';
import 'package:pharmacy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_app/config/user_information.dart';
import 'package:pharmacy_app/native_service/secure_storage.dart';

import '../../models/user.dart';
class LoginService{
  var message;
  var token;
  var url=Uri.parse(ServerConfiguration.domainNameServer+ServerConfiguration.login);
  Future<bool>login(User user,bool checkBox)async{
  var response =await http.post(
    url,
    headers: {
      "Accept":"application/json"
    },
    body: {
      'phone':user.phoneNumber,
      'password':user.password,
    },
  );

  if(response.statusCode==200){
    var jsonResponse=jsonDecode(response.body);
    message='login Successfully';
    token=jsonResponse['token'];
    UserInformation.userToken=token;
    if(checkBox){
      SecureStorage storage=SecureStorage();
     await storage.save('token', UserInformation.userToken);
    }
    return true;
  }
  else if(response.statusCode==422){
    var jsonResponse=jsonDecode(response.body);
    message=jsonResponse['message'];
    return false;
  }else if(response.statusCode==401){
    var jsonResponse=jsonDecode(response.body);
    message=jsonResponse['error'];
    return false;
  }else{
    return false;
  }
}

}