import 'package:flutter/gestures.dart';
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
              const SizedBox(height: 150),
              Text(
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              const Text(
                'Minimum length password 8 character with\n Latter and number combination',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Confirm Password'),
              ),
              const SizedBox(height: 15),
              FilledButton(onPressed: () {}, child: const Text('Confirm')),
              const SizedBox(height: 50),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have an acoount? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
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
                          },
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
