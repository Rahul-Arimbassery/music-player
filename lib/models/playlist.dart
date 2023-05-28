import 'package:hive/hive.dart';

part 'playlist.g.dart';

@HiveType(typeId: 1)
class Playlist {
  @HiveField(1)
  final String playlistName;

  @HiveField(2)
  final int playlistIndex;

  Playlist({
    required this.playlistName,
    required this.playlistIndex,
  });

  @override
  String toString() {
    return 'AllSongs: {playlistName: $playlistName,playlistIndex:$playlistIndex}';
  }
}
