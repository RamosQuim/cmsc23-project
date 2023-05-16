import 'package:flutter/material.dart';
import '../api/firebase_user_api.dart';
import '../models/user_model.dart';

class UserListProvider with ChangeNotifier {
  late FirebaseUserAPI firebaseService;

  UserListProvider() {
    firebaseService = FirebaseUserAPI();
  }

  void addUser(User user) async {
    String message = await firebaseService.addUser(user.toJson(user));
    print(message);
    notifyListeners();
  }
}
