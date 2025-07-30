import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lab_attendance/app/app.constants.dart';
import 'package:lab_attendance/features/home/view/home.attendancewidget.dart';
import 'package:lab_attendance/features/user/view/user.view.dart';
import 'package:lab_attendance/features/user/user.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final users = userController.userList;

    return Obx(() => Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: null,
          centerTitle: true,
          flexibleSpace: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Text(
                  '312_attendance',
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 40.sp,
                    color: colTitle,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                AttendanceStatus(name: userController.name.value),
                SizedBox(height: 130.h,),
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  width: 275.w,
                  height: 360.h,
                  decoration: BoxDecoration(
                    color: colBigRadiusRec,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: users.map((user) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: AttendanceStatusOthers(name: user.name, status: user.currentStatus,),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20.h,
              right: 20.w,
              child: IconButton(
                onPressed: () {
                  Get.to(() => const UserView());
                },
                icon: Icon(Icons.settings),
                iconSize: 30.sp,
                color: Colors.grey.shade800,
              ),
            )
          ],
        ),
      ),
    ));
  }
}