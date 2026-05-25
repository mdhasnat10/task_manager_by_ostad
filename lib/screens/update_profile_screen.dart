import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/controller/auth_controller.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/user_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/screens/main_nav_screen.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserModel user = AuthController.userData!;

    _emailController.text = user.email!;
    _firstNameController.text = user.firstName!;
    _lastNameController.text = user.lastName!;
    _mobileController.text = user.mobile!;
  }

  Future<void> updateProfile() async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "mobile": _mobileController.text,
    };

    if (_passwordController.text.isNotEmpty) {
      requestBody['password'] = _passwordController.text;
    }

    final ApiResponse response = await ApiCaller.postRequest(
      URL: Urls.updateProfileURL,
      body: requestBody,
    );

    if (response.isSuccess) {
      UserModel model = UserModel(
        sId: AuthController.userData?.sId,
        email: _emailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        mobile: _mobileController.text,
      );

      AuthController.updateUserData(model);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Profile update success... ')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Failed to update profile... ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_Appbar(),
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: .start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Photos',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(child: const Text(' Upload Image')),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 15),
              FilledButton(
                onPressed: () {
                  updateProfile();
                },
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
