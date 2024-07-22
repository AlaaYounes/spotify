import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  bool hideBack;

  AppHeader({super.key, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hideBack
          ? const SizedBox()
          : GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
      centerTitle: true,
      title: SvgPicture.asset(
        AppVectors.logo,
        height: 40.h,
      ),
    );
  }
}
