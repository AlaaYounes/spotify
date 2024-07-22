import '../../domain/entities/song_entity.dart';

abstract class HomeScreenStates {}

class HomeScreenInitial extends HomeScreenStates {}

class HomeScreenLoading extends HomeScreenStates {}

class GetSongsSuccessState extends HomeScreenStates {
  final List<SongEntity> songs;

  GetSongsSuccessState({required this.songs});
}

class GetSongsErrorState extends HomeScreenStates {
  final String error;

  GetSongsErrorState({required this.error});
}

class GetSongsPlaylistSuccessState extends HomeScreenStates {
  final List<SongEntity> songs;

  GetSongsPlaylistSuccessState({required this.songs});
}

class GetSongsPlaylistErrorState extends HomeScreenStates {
  final String error;

  GetSongsPlaylistErrorState({required this.error});
}
