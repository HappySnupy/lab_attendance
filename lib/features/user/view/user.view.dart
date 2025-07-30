import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_attendance/app/app.constants.dart';
import 'package:lab_attendance/features/user/user.controller.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Obx(() => Column(
          children: [
            Align(
              child: Stack(
                children: [
                  Container(
                    width: 365.w,
                    height: userController.isEditing.value
                        ? 160.h : 120.h,
                    decoration: BoxDecoration(
                      color: colBigRadiusRec,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: userController.isEditing.value
                              ? TextField(
                            controller: userController.nameController,
                            decoration: InputDecoration(labelText: 'name'),
                          )
                              : Text(
                            'name: ${userController.name.value}',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: colTitle,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: userController.isEditing.value
                              ? TextField(
                            controller: userController.idController,
                            decoration: InputDecoration(labelText: 'student_id'),
                          )
                              : Text(
                            'student_id: ${userController.studentId.value}',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: colTitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(Icons.edit, size: 20.sp),
                      onPressed: () {
                        userController.startEditing();
                      },
                    ),
                  ),
                  if (userController.isEditing.value)
                    Positioned(
                      bottom: 0,
                      right: 15.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => userController.save(),
                        child: Text('save', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
