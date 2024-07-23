import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/features/layout/domain/entities/song_entity.dart';
import 'package:spotify/features/playing_scong/presentation/widgets/audio_player.dart';

import '../../../../core/config/assets/app_vectors.dart';
import '../../../../core/config/theme/app_colors.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 20.sp,
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.network(
                song.imageUrl,
                width: 335.w,
                height: 370.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      song.artist,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppVectors.favIcon,
                      height: 30.h,
                      width: 30.w,
                    )),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            SongPlayer(
              song: song,
            ),
          ],
        ),
      ),
    );
  }
}
