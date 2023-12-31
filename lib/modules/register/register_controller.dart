import 'package:get/get.dart';
import 'package:pharmacy_app/models/user.dart';
import 'package:pharmacy_app/modules/register/register_service.dart';

class RegisterController extends GetxController {
  var userName ;
  var phoneNumber;
  var password ;
  var registerStatus ;
  var checkPasswordStatus;
  late RegisterService service;
  var message;

  @override
  void onInit() {
    phoneNumber='';
    password='';
    userName = '';
    registerStatus=false;
    checkPasswordStatus=true.obs;
    service= RegisterService();
    super.onInit();
  }
  void changeCheckPassword(){
    checkPasswordStatus(!(checkPasswordStatus.value));
  }
  Future<void> clickOnRegister() async {
    User user = User(
      password: password,
      userName: userName,
      phoneNumber: phoneNumber,
    );
    registerStatus = await service.register(user);
    message=service.message;
  }
}
