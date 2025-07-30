import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lab_attendance/app/app.constants.dart';
import 'package:lab_attendance/features/user/user.controller.dart';

class AttendanceStatus extends StatelessWidget {
  final String name;

  const AttendanceStatus({
    super.key,
    required this.name,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case '출석':
        return colAttendance;
      case '결석':
        return colAbsence;
      case '밥':
        return colBob;
      case '잠시':
        return colFAM;
      default:
        return colAttendance;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Courier',
            fontSize: 20.sp,
            color: colTitle,
            fontWeight: FontWeight.w200,
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => StatusSelector(),
            );
          },
          child: Obx(() => Container(
            width: 100.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: colRadiusRec,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userController.currentStatus.value,
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 20.sp,
                    color: colStateText,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(width: 10.sp,),
                Container(
                  width: 16.sp,
                  height: 16.sp,
                  decoration: BoxDecoration(
                    color: getStatusColor(userController.currentStatus.value),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                )
              ],
            ),
          ),),)
      ],
    );
  }
}

class StatusSelector extends StatelessWidget {
  StatusSelector({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> statuses = [
    {'label': '출근', 'color': colAttendance},
    {'label': '잠시', 'color': colFAM},
    {'label': '밥', 'color': colBob},
    {'label': '결석', 'color': colAbsence},
  ];
  
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];

          return ListTile(
            title: Text(status['label']),
            trailing: CircleAvatar(backgroundColor: status['color'], radius: 8),
            onTap: () {
              userController.updateStatus(status['label']); // 상태 변경
              Get.back(); // 닫기
            },
          );
        },
      ),
    );
  }
}

class AttendanceStatusOthers extends StatelessWidget {
  final String name;
  final String status;

  const AttendanceStatusOthers({
    super.key,
    required this.name,
    required this.status,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case '출석':
        return colAttendance;
      case '결석':
        return colAbsence;
      case '밥':
        return colBob;
      case '잠시':
        return colFAM;
      default:
        return colAttendance;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Courier',
            fontSize: 20.sp,
            color: colTitle,
            fontWeight: FontWeight.w200,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 100.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: colRadiusRec,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 20.sp,
                  color: colStateText,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(width: 10.sp,),
              Container(
                width: 16.sp,
                height: 16.sp,
                decoration: BoxDecoration(
                  color: getStatusColor(status),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
              )
            ],
          )
        )
      ]
    );
  }
}