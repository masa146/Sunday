import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/components/custom_icon.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/modules/home/home_controller.dart';
import 'package:pharmacy_app/modules/logout/logout_controller.dart';
import 'package:pharmacy_app/modules/navbar/navbar_view.dart';

import '../../components/custom_category.dart';
import '../../models/category.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {

  HomeController controller = Get.find();
  LogoutController logoutController= Get.put(LogoutController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NavBar(),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: firstBackColor,
        //leading: const Icon(Icons.menu),
        title: const Text('Pharmacy'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: IconButton(
              onPressed: () {},
              icon:  IconButton(
                icon:const Icon(Icons.search),
                onPressed:(){
                  Get.toNamed('/search');
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/pharmacy.jpg',
                height: 200.h,
                width: 400.w,
                fit: BoxFit.fill,
              ),
              Divider(
                thickness: 2.sp,
                color: Colors.blueGrey,
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 40.h,
                ),
                child: Text(
                  'Shop by category',
                  style: TextStyle(
                    fontSize: 23.sp,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child:Obx(() {
                  if (controller.isLoading.isTrue) {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }
               return  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2.h,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                    ),
                    itemCount: controller.categoriesList.length,
                    itemBuilder: (context, index) {
                      return CustomCategory(category: controller
                          .categoriesList[index], onPressed: () {
                        Get.toNamed("/medicineList");
                      },);
                    },
                  )
                  ;
                } )

              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: CustomIcon(
            icon: Icons.shopping_cart,
            onpressed: () {},
          ),
          actions: [
            CustomIcon(
              icon: Icons.home,
              onpressed: () {},
            ),
            CustomIcon(
              icon: Icons.favorite,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
