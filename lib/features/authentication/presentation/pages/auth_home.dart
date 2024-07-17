import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/app_images.dart';

import '../widgets/auth_home_body.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.topPattern)),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(AppImages.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.autHome,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          const AuthHomeBody(),
        ],
      ),
    );
  }
}
