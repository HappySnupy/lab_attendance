import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isEditing = false.obs;
  var name = 'name'.obs;
  var studentId = 'student_id'.obs;

  late final TextEditingController nameController;
  late final TextEditingController idController;

  var currentStatus = "status".obs;

  @override
  void onInit() {
    nameController = TextEditingController(text: name.value);
    idController = TextEditingController(text: studentId.value);
    super.onInit();
  }

  void startEditing() {
    nameController.text = name.value;
    idController.text = studentId.value;
    isEditing.value = true;
  }

  void save() {
    name.value = nameController.text;
    studentId.value = idController.text;
    isEditing.value = false;
  }

  void updateStatus(String newStatus) {
    currentStatus.value = newStatus;
  }
}
