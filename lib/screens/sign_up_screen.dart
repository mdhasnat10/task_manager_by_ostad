import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/email_address.dart';
import 'package:task_manager_by_ostad/screens/log_in_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';

class Sign_up_Screen extends StatefulWidget {
  const Sign_up_Screen({super.key});

  @override
  State<Sign_up_Screen> createState() => _Sign_up_ScreenState();
}

class _Sign_up_ScreenState extends State<Sign_up_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 100),
              Text(
                'Join With Us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'First Name')),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 15),
              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),

              SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have an acoount? ',
                    style: TextStyle(color: Colors.black, fontWeight: .w600),
                    children: [
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                          color: AppColors.Pcolor,
                          fontWeight: .w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
