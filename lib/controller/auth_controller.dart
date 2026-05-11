// import 'package:http/http.dart' as SharedPreferences;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_by_ostad/screens/data/model/user_model.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

class AuthController {

  static String? accessToken;
  static UserModel? userData;


  static Future saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
    accessToken = token;
    userData = model;
  }

  static Future<bool> isUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String ? token = sharedPreferences.getString('token');

    return token != null;
  }
}
