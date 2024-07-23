import 'package:spotify/features/layout/domain/entities/song_entity.dart';

class SongResponse extends SongEntity {
  SongResponse(
      {required super.name,
      required super.artist,
      required super.duration,
      required super.releaseDate,
      required super.imageUrl,
      required super.songUrl});

  factory SongResponse.fromJson(Map<String, dynamic> map) {
    return SongResponse(
      name: map['name'],
      artist: map['artist'],
      duration: map['duration'],
      releaseDate: map['releaseDate'],
      imageUrl: map['imageURL'],
      songUrl: map['songURL'],
    );
  }
}
