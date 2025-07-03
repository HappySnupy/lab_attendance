import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lab_attendance/app/app.controller.dart';
import 'package:lab_attendance/app/app.constants.dart';
import 'package:lab_attendance/routes/app.route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleWH: () => true,
      enableScaleText: () => true,
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        theme: ThemeData(
          scaffoldBackgroundColor: colBackground,
          appBarTheme: AppBarTheme(
            backgroundColor: colBackground,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: colBackground)
        ),
        getPages: AppRoutes.routes,
      ),
    );
  }
}