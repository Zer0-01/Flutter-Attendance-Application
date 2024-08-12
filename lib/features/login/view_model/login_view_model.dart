import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/data/remote/response/api_response.dart';
import 'package:flutter_attendance_application/features/home/view/home_view.dart';
import 'package:flutter_attendance_application/models/user_response_model.dart';

class LoginViewModel extends ChangeNotifier {
  ApiResponse<UserResponseModel>? userResponse;

  void _setUserResponse(ApiResponse<UserResponseModel> response) {
    userResponse = response;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    _setUserResponse(ApiResponse.loading());
    await Future.delayed(const Duration(seconds: 2));
     _setUserResponse(ApiResponse.completed(UserResponseModel(
        id: '4',
        name: 'John Doe',
        email: 'john@gmail.com',
        password: "meow",
        role: "hebat")));
    Navigator.pushNamed(context, HomeView.id);
  }
}
