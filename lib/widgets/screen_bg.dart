import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_by_ostad/utils/assets_path.dart';

class Screen_BG extends StatelessWidget {
  final Widget child;
  const Screen_BG({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.backgroundSVG,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: .cover,
        ),

        SafeArea(child: child),
      ],
    );
  }
}
