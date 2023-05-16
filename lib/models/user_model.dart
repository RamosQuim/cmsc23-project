import 'dart:convert';

class User {
  final int userId;
  String? id;
  String name;
  String username;
  String college;
  String course;
  String studentNumber;

  User(
      {required this.userId,
      this.id,
      required this.name,
      required this.username,
      required this.college,
      required this.course,
      required this.studentNumber});

  // Factory constructor to instantiate object from json format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      name: json['name'],
      username: json['username'],
      college: json['college'],
      course: json['course'],
      studentNumber: json['studentNumber'],
    );
  }

  static List<User> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<User>((dynamic d) => User.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(User username) {
    return {
      'userId': username.userId,
      'name': username.name,
      'username': username.username,
      'college': username.college,
      'course': username.course,
      'studentNumber': username.studentNumber,
    };
  }
}
