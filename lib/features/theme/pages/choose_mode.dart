import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/app_images.dart';

import '../widgets/choose_mode_body.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            AppImages.backgroundTheme,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const ChooseModeBody(),
        ],
      ),
    );
  }
}
