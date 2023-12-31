import 'package:get/get.dart';
import 'package:pharmacy_app/models/user.dart';

import 'package:pharmacy_app/modules/login/login_service.dart';
import 'package:pharmacy_app/native_service/secure_storage.dart';



class LoginController extends GetxController {
  var phoneNumber;
  var password ;
  var loginStatus ;
  late LoginService service ;
  var checkBoxStatus;
  var checkPasswordStatus;
  var message;

  @override
  void onInit() {
    phoneNumber='';
    password='';
    loginStatus=false;
    checkPasswordStatus=true.obs;
    service=LoginService();
    checkBoxStatus=false.obs;
    super.onInit();
  }
  void changeCheckPassword(){
    checkPasswordStatus(!(checkPasswordStatus.value));
  }
  void changeCheckBox()async{
    checkBoxStatus(!(checkBoxStatus.value));
    SecureStorage storge=SecureStorage();
    String? test=await storge.read('token');
    print(test);
  }
  Future<void> loginOnClick() async {
   User user1=User(
     phoneNumber: phoneNumber,
     password: password,
   );
 loginStatus=await service.login(user1,checkBoxStatus.value );
    message = service.message;
  }
}
