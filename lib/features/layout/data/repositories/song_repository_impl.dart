import 'package:dartz/dartz.dart';
import 'package:spotify/features/layout/data/models/song_response.dart';
import 'package:spotify/features/layout/domain/repositories/song_repo.dart';

import '../../../../service_locator.dart';
import '../data_sources/firebase_service.dart';

class SongRepositoryImpl extends SongRepository {
  var songFirebaseService = sl<SongFirebaseService>();

  @override
  Future<Either<String, List<SongResponse>>> getSongs() async {
    return await songFirebaseService.getSongs();
  }

  @override
  Future<Either<String, List<SongResponse>>> getSongsPlaylist() async {
    return await songFirebaseService.getSongsPlaylist();
  }
}
