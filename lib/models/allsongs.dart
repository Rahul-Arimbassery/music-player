import 'package:hive/hive.dart';

part 'allsongs.g.dart';

@HiveType(typeId: 0)
class AllSongs {
  @HiveField(0)
  final int songID;

  AllSongs({
    required this.songID,
  });

   @override
  String toString() {
    return 'AllSongs: {songID: $songID}';
  }
}
