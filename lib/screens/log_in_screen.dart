import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/controller/auth_controller.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/user_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/screens/email_address.dart';
import 'package:task_manager_by_ostad/screens/main_nav_screen.dart';
import 'package:task_manager_by_ostad/screens/new_task_screen.dart';
import 'package:task_manager_by_ostad/screens/sign_up_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordCOntroller = TextEditingController();
  final signInkey = GlobalKey<FormState>();

  Future<void> _signIn() async {
    Map<String, dynamic> resquestBody = {
      "email": _emailController.text,
      "password": _passwordCOntroller.text,
    };

    final ApiResponse response = await ApiCaller.postRequest(
      URL: Urls.signInUrl,
      body: resquestBody,
    );

    if (response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];
      AuthController.saveUserData(model, accessToken);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainNavScreen()),
        (route) => false,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Success')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: signInkey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 150),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Email';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  controller: _passwordCOntroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 15),
                FilledButton(
                  onPressed: () {

                    if(signInkey.currentState!.validate()){
                      _signIn();
                    }

                    
                  },
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),

                SizedBox(height: 50),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailAddress(),
                            ),
                          );
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: .w600,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: 'Don\'t have an acoount? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: .w600,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign Up',
                              style: TextStyle(
                                color: AppColors.Pcolor,
                                fontWeight: .w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Sign_up_Screen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
