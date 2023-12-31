import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/models/medicine.dart';
import 'package:pharmacy_app/modules/medicine_card/medicine_card_controller.dart';



class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final VoidCallback onTap;

  MedicineCard({Key? key, required this.medicine, required this.onTap}) {
    Get.put(MedicineCardController(medicine.quantity.obs),
        tag: medicine.trade_name);
  }

  @override
  Widget build(BuildContext context) {
    final MedicineCardController controller =
    Get.find<MedicineCardController>(tag: medicine.trade_name);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 180.h,
            width: 300.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.blueGrey, width: 5))),
            child: Row(
              children: [
                Container(
                  height: 120.h,
                  width: 90.w,
                  margin: EdgeInsets.only(right: 25.sp),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(medicine.image))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.trade_name,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                          '${controller.counter.value}',
                          style: TextStyle(
                              fontSize: 15.sp, color: Colors.grey),
                        )),
                        Text(
                          " pieces",
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100.w),
                          child: Obx(() => IconButton(
                            icon: (controller.isFavorited.value
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border)),
                            color: Colors.red[800],
                            onPressed: controller.toggleFavorite,
                          )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${medicine.price}',
                          style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                        ),
                        const Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.h,
                          child: FloatingActionButton(
                            onPressed: controller.decrementCounter,
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Obx(() => Text(
                          '${controller.counter.value}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                        SizedBox(width: 20.w),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          child: FloatingActionButton(
                            onPressed: controller.incrementCounter,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
