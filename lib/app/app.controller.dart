import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_attendance/features/user/user.controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    ///TODO: controller implement
  }
}