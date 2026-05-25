import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/controller/auth_controller.dart';
import 'package:task_manager_by_ostad/screens/log_in_screen.dart';
import 'package:task_manager_by_ostad/screens/update_profile_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';

class TM_Appbar extends StatelessWidget implements PreferredSize {
  const TM_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.Pcolor,
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/mypicture.jpg'),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '${AuthController.userData?.firstName ?? ''} ${AuthController.userData?.lastName ?? ''}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.white),
                ),
                 Text(
                  AuthController.userData!.email.toString() ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LogInScreen()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
