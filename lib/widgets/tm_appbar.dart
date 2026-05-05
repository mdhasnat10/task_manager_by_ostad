import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/updae_profile_screen.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';


class TM_Appbar extends StatelessWidget implements PreferredSize{
  const TM_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.Pcolor,
      title: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdaeProfileScreen(),));
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
                  'Md Abu Hasnat',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.white),
                ),
                Text(
                  'mdhasnat.ju@gmail.com',
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
          onPressed: () {},
          icon: Icon(Icons.logout, color: Colors.white),
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
