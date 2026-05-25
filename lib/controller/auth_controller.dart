// import 'package:http/http.dart' as SharedPreferences;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_by_ostad/screens/data/model/user_model.dart';
// import 'package:shared_preferences_android/shared_preferences_android.dart';

class AuthController {

  static String? accessToken;
  static UserModel? userData;
  static final Logger _logger = Logger();


  static Future saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
    accessToken = token;
    userData = model;
    print(userData);
  }

  static Future updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();

    await sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
    userData = model;
    print(userData);
  }

  static Future<bool> isUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String ? token = sharedPreferences.getString('token');
    return token != null;
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ?token = sharedPreferences.getString('token');


    if(token != null){
      accessToken = token;
    }
    String ? user = sharedPreferences.getString('user-data');

    if(user != null && user.isNotEmpty){
      userData = UserModel.fromJson(jsonDecode(user));
    }
    _logger.i(accessToken);
    _logger.i(userData);
  }

  static Future<void>cleanUserData(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }


}
