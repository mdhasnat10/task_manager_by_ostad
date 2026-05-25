import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/log_in_screen.dart';
import 'package:task_manager_by_ostad/screens/pin_verify.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';

class EmailAddress extends StatefulWidget {
  const EmailAddress({super.key});

  @override
  State<EmailAddress> createState() => _EmailAddressState();
}

class _EmailAddressState extends State<EmailAddress> {
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
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15),
              const Text(
                'A 6 Digit verification pin will send to your\n email address',
                style: TextStyle(color: Colors.grey, fontWeight: .w600),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 15),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pin_Verify_Screen(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 50),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have an acoount? ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: .w600,
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
