import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/features/layout/presentation/widgets/playlist_item.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  bool seeMore = false;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Playlist',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                seeMore = !seeMore;
                setState(() {});
              },
              child: Text(
                seeMore ? 'See less' : 'See more',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        BlocBuilder<HomeScreenCubit, HomeScreenStates>(
          builder: (BuildContext context, HomeScreenStates state) {
            if (state is GetSongsPlaylistErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            } else if (state is HomeScreenLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else {
              return Column(
                children: List.generate(
                  seeMore ? cubit.songsPlaylist.length : 3,
                  (index) {
                    return Column(
                      children: [
                        PlaylistItem(
                          song: cubit.songsPlaylist[index],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
