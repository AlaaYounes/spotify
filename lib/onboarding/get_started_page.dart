import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/utils/extensions/build_context.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';

import '../features/theme/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            width: double.infinity,
            AppImages.onboarding,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: context.safeAreaPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                Text(
                  "Enjoy listening to music",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Millions of songs. No credit card needed.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30.h),
                BasicAppButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseMode(),
                      ),
                    );
                  },
                  title: 'Get Started',
                  width: 300.w,
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
