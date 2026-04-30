import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/email_address.dart';
import 'package:task_manager_by_ostad/screens/new_task_screen.dart';
import 'package:task_manager_by_ostad/screens/sign_up_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 150),
              Text(
                'Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 15),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewTaskScreen(),));
                },
                child: Icon(Icons.arrow_circle_right_outlined),
              ),

              SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailAddress(),));
                      },
                      child: Text(
                        'Forget password?',
                        style: TextStyle(color: Colors.grey, fontWeight: .w600, fontSize: 12),
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
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up_Screen(),));
                            }
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
    );
  }
}
