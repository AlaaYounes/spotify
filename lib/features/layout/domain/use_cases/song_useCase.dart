import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../entities/song_entity.dart';
import '../repositories/song_repo.dart';

class SongUseCases {
  var songRepository = sl<SongRepository>();

  Future<Either<String, List<SongEntity>>> getSongs() async {
    return await songRepository.getSongs();
  }

  Future<Either<String, List<SongEntity>>> getSongPlaylist() async {
    return await songRepository.getSongsPlaylist();
  }
}
