import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String name;
  final String artist;
  final double duration;
  final Timestamp releaseDate;
  final String imageUrl;
  final String songUrl;

  SongEntity({
    required this.name,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.imageUrl,
    required this.songUrl,
  });
}
