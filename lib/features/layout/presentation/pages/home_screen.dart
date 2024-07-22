import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/features/layout/presentation/widgets/playlist.dart';
import 'package:spotify/features/layout/presentation/widgets/songs_list.dart';
import 'package:spotify/features/layout/presentation/widgets/tabs_list.dart';

import '../../../../core/config/assets/app_images.dart';
import '../../../authentication/presentation/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  User user;

  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            AppHeader(
              hideBack: true,
            ),
            SizedBox(
              height: 150.h,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(AppVectors.homeTopCard)),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(AppImages.advertisement)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const TabsList(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(height: 250.h, child: const SongsList()),
            SizedBox(
              height: 20.h,
            ),
            const Playlist(),
          ],
        ),
      ),
    );
  }
}
