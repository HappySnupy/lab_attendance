import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lab_attendance/app/app.constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '312_attendance',
          style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 35.sp,
              color: colTitle,
              fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Placeholder(),
      )
    );
  }
}