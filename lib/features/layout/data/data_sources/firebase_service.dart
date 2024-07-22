import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/features/layout/data/models/song_response.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongResponse>>> getSongs();

  Future<Either<String, List<SongResponse>>> getSongsPlaylist();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either<String, List<SongResponse>>> getSongs() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      return right(
          data.docs.map((e) => SongResponse.fromJson(e.data())).toList());
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<SongResponse>>> getSongsPlaylist() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();
      return right(
          data.docs.map((e) => SongResponse.fromJson(e.data())).toList());
    } catch (e) {
      return left(e.toString());
    }
  }
}
