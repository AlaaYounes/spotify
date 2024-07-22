import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/features/layout/presentation/widgets/song_item_list.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      builder: (BuildContext context, HomeScreenStates state) {
        if (state is GetSongsErrorState) {
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
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.newReleaseSongs.length,
            itemBuilder: (context, index) {
              return SongsListItem(
                song: cubit.newReleaseSongs[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10.w,
              );
            },
          );
        }
      },
    );
  }
}
