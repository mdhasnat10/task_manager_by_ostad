import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/log_in_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';

class Set_Password_Screen extends StatefulWidget {
  const Set_Password_Screen({super.key});

  @override
  State<Set_Password_Screen> createState() => _Set_Password_ScreenState();
}

class _Set_Password_ScreenState extends State<Set_Password_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 150),
              Text(
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15),
              Text(
                'Minimum length password 8 character with \n Latter and number combination',
                style: TextStyle(color: Colors.grey, fontWeight: .w600),
              ),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'Confirm Password'),
              ),
              SizedBox(height: 15),
              FilledButton(onPressed: () {}, child: Text('Confirm')),
              SizedBox(height: 50),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
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
                        ),
                      ],
                    ),
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
