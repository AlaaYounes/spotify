import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/features/layout/domain/entities/song_entity.dart';

class SongsListItem extends StatelessWidget {
  final SongEntity song;

  const SongsListItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 150.w,
              height: 199.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(song.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xff2C2C2C)
                      : const Color(0xffE6E6E6),
                  image: DecorationImage(
                      image: AssetImage(
                          Theme.of(context).brightness == Brightness.dark
                              ? AppImages.playIconDark
                              : AppImages.playIcon)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          song.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17.sp,
              ),
        ),
        Text(
          song.artist,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
