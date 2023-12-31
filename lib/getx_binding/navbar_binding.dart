import 'package:get/get.dart';

import '../modules/navbar/navbar_controller.dart';

class NavBarBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<NavBarController>(NavBarController());
  }

}