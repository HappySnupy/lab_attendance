import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_attendance/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isEditing = false.obs;
  var name = 'name'.obs;
  var studentId = 'student_id'.obs;

  late final TextEditingController nameController;
  late final TextEditingController idController;

  var currentStatus = "status".obs;

  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    nameController = TextEditingController(text: name.value);
    idController = TextEditingController(text: studentId.value);
    loadSavedUser();
    fetchUsersFromServer();
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
    saveUser();
  }

  void updateStatus(String newStatus) {
    currentStatus.value = newStatus;
  }

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name.value);
    await prefs.setString('studentId', studentId.value);
  }

  Future<void> loadSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('userName') ?? 'name';
    studentId.value = prefs.getString('studentId') ?? 'student_id';
  }

  Future<void> fetchUsersFromServer() async {
    await Future.delayed(Duration(milliseconds: 500)); // 로딩 딜레이 흉내

    final dummyJson = '''
  [
    { "name": "고은결", "student_id": "20231234", "status": "출석" },
    { "name": "곽도현", "student_id": "20231235", "status": "결석" },
    { "name": "손태균", "student_id": "20231236", "status": "밥" },
    { "name": "허강민", "student_id": "20231237", "status": "잠시" }
  ]
  ''';

    final data = json.decode(dummyJson) as List;
    userList.value = data.map((e) => UserModel.fromJson(e)).toList();
  }


// Future<void> fetchUsersFromServer() async {
  //   try {
  //     final response = await http.get(Uri.parse('https://서버주소/api/users'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body) as List;
  //       userList.value = data.map((json) => UserModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception("불러오기 실패");
  //     }
  //   } catch (e) {
  //     Get.snackbar("에러", "서버 통신 실패: $e");
  //   }
  // }
}
