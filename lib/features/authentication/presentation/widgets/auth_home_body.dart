import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';

import '../pages/register_screen.dart';
import '../pages/signin_screen.dart';

class AuthHomeBody extends StatelessWidget {
  const AuthHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.logo),
        SizedBox(
          height: 70.h,
        ),
        Text(
          "Enjoy Listening To Music",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 30.h),
        Text(
          "Spotify is a proprietary Swedish audio \n streaming and media services provider ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 50.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BasicAppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              width: 150.w,
              height: 75.h,
              title: 'Register',
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                'Sign in',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        Flexible(
          child: SizedBox(
            height: 250.h,
          ),
        ),
      ],
    );
  }
}
