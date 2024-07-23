import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/features/playing_scong/presentation/cubit/states.dart';

class SongPlayerCubit extends Cubit<SongPlayerStates> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoadingState()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlay();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  updateSongPlay() {
    emit(SongPlayerSuccessState());
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerSuccessState());
    } catch (e) {
      emit(SongPlayerErrorState());
    }
  }

  void playAndPause() async {
    if (audioPlayer.playing) {
      await audioPlayer.stop();
    } else {
      await audioPlayer.play();
    }
  }

  formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Future<void> close() {
    audioPlayer.stop();
    return super.close();
  }
}
