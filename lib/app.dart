import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:task_manager_by_ostad/screens/splash_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';

class Task_Manager_by_Ostad extends StatelessWidget {
  const Task_Manager_by_Ostad({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: .w800),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(borderSide: .none),
          border: OutlineInputBorder(borderSide: .none),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.Pcolor,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Task Manager',
      home: SplashScreen(),
    );
  }
}
