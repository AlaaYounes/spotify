import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/utils/extensions/build_context.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';

import '../../authentication/presentation/pages/auth_home.dart';
import '../cubit/cubit.dart';

class ChooseModeBody extends StatelessWidget {
  const ChooseModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.safeAreaPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SvgPicture.asset(AppVectors.logo),
          ),
          const Spacer(),
          Text(
            'Choose Mode',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ThemeCubit>()
                          .updateThemeMode(ThemeMode.dark);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(AppVectors.moon),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Dark Mode',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ThemeCubit>()
                          .updateThemeMode(ThemeMode.light);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(AppVectors.sun),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Light Mode',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 110.h,
          ),
          BasicAppButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthHome(),
                ),
              );
            },
            title: 'Continue',
            width: 300.w,
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
