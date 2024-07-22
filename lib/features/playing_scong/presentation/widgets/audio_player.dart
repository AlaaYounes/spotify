import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/features/layout/domain/entities/song_entity.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SongPlayer extends StatelessWidget {
  const SongPlayer({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongPlayerCubit()
        ..loadSong(
          song.songUrl,
        ),
      child: BlocBuilder<SongPlayerCubit, SongPlayerStates>(
          builder: (context, state) {
        if (state is SongPlayerLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is SongPlayerSuccessState) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context
                        .read<SongPlayerCubit>()
                        .formatDuration(
                            context.read<SongPlayerCubit>().songPosition)
                        .toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    context
                        .read<SongPlayerCubit>()
                        .formatDuration(
                            context.read<SongPlayerCubit>().songDuration)
                        .toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playAndPause();
                },
                child: Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: context.read<SongPlayerCubit>().audioPlayer.playing
                      ? Icon(Icons.pause, color: AppColors.white, size: 35.r)
                      : Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.white,
                          size: 35.r,
                        ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
