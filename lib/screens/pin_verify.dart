import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/log_in_screen.dart';
import 'package:task_manager_by_ostad/screens/set_password.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pin_Verify_Screen extends StatefulWidget {
  const Pin_Verify_Screen({super.key});

  @override
  State<Pin_Verify_Screen> createState() => _Pin_Verify_ScreenState();
}

class _Pin_Verify_ScreenState extends State<Pin_Verify_Screen> {
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
                'Pin Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15),
              Text(
                'A 6 Digit verification pin will send to your\n email address',
                style: TextStyle(color: Colors.grey, fontWeight: .w600),
              ),
              SizedBox(height: 15),
              PinCodeTextField(
                appContext: context, 
                length: 6,
                obscureText: true,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldWidth: 40,
                  fieldHeight: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.grey.shade300,
                  selectedColor: AppColors.Pcolor,
                  
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8)
                ),
                backgroundColor: Colors.transparent,
                ),
              SizedBox(height: 15),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Set_Password_Screen(),));
                },
                child: Text('Verify'),
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
