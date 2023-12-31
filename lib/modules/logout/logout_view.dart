
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/modules/logout/logout_controller.dart';
import 'package:pharmacy_app/modules/splash/splash_view.dart';

class Logout extends StatelessWidget {

  LogoutController controller= Get.find();

  Logout({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:const  Icon(Icons.exit_to_app),
      title:const Text('Exit'),
      onTap: () {
        onClickLogout();
      },
    );
  }
  void onClickLogout()async {
    EasyLoading.show(status: 'loading...');
    await controller.logoutOnClick();
    if (controller.logoutStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/login');
    }else{
      EasyLoading.showError(
        controller.message,
        dismissOnTap: true,
        duration: const Duration(seconds: 60),
      );
    }
  }
}
