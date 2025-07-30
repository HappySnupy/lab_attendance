class UserModel {
  final String name;
  final String studentId;
  final String currentStatus;

  UserModel({required this.name, required this.studentId, required this.currentStatus});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      studentId: json['student_id'],
      currentStatus: json['status'],
    );
  }
}
