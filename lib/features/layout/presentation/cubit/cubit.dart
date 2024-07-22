import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/layout/presentation/cubit/states.dart';

import '../../../../service_locator.dart';
import '../../domain/entities/song_entity.dart';
import '../../domain/use_cases/song_useCase.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitial());

  static HomeScreenCubit get(context) => BlocProvider.of(context);
  var songUseCase = sl<SongUseCases>();
  List<SongEntity> newReleaseSongs = [];
  List<SongEntity> songsPlaylist = [];

  getSongs() async {
    emit(HomeScreenLoading());
    var response = await songUseCase.getSongs();
    response.fold((l) {
      emit(GetSongsErrorState(error: l));
    }, (r) {
      newReleaseSongs = r;
      emit(GetSongsSuccessState(songs: r));
    });
  }

  getSongPlaylist() async {
    emit(HomeScreenLoading());
    var response = await songUseCase.getSongPlaylist();
    response.fold((l) {
      emit(GetSongsPlaylistErrorState(error: l));
    }, (r) {
      songsPlaylist = r;
      emit(GetSongsPlaylistSuccessState(songs: r));
    });
  }
}
