import 'package:dartz/dartz.dart';
import 'package:spotify/features/layout/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<String, List<SongEntity>>> getSongs();

  Future<Either<String, List<SongEntity>>> getSongsPlaylist();
}
