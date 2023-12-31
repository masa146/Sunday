import 'package:get/get.dart';
import 'package:pharmacy_app/modules/medicine_list/medicine_list_controller.dart';




class MedicinesListBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<MedicinesListController>(MedicinesListController());
  }

}