import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/features/layout/domain/entities/song_entity.dart';

import '../../../../core/config/assets/app_images.dart';
import '../../../../core/config/assets/app_vectors.dart';

class PlaylistItem extends StatelessWidget {
  const PlaylistItem({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
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
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        ),
        const Spacer(),
        Text(
          song.duration.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(width: 20.w),
        SvgPicture.asset(
          AppVectors.favIcon,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
