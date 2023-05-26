import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:musicuitest/globalpage.dart';
import 'package:musicuitest/homepage.dart';
import 'package:musicuitest/screens/nowplaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/allsongs.dart';

final OnAudioQuery _audioQuery = OnAudioQuery();

List<bool> isFavoriteChanged = List.generate(500, (index) => false);

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<int> indexes = [];

  @override
  void initState() {
    //clearFavoritedb();
    super.initState();
    readFavoritedb().then((resultIndexes) {
      setState(() {
        indexes = resultIndexes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Favorite Songs",
          style: TextStyle(
            color: Color.fromARGB(255, 27, 164, 179),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView.separated(
          itemCount: indexes.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height:
                  4, // set the desired height of the space between each ListTile
            );
          },
          itemBuilder: (context, index) {
            int currentindex = indexes[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(
                  25.0), // set the desired border radius value
              child: Card(
                color: const Color.fromARGB(255, 252, 251, 251),
                elevation: 3.0,
                shadowColor: const Color.fromARGB(255, 252, 251, 251),
                child: SizedBox(
                  height: 70.0, // set the desired height of the Card
                  width: double
                      .infinity, // set the width to match the parent ListView
                  child: InkWell(
                    onTap: () {
                      //_audioPlayer.stop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NowPlaying(
                            index: currentindex,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: QueryArtworkWidget(
                        controller: _audioQuery,
                        id: ids[currentindex],
                        type: ArtworkType.AUDIO,
                      ),
                      title: Text(
                        songNames[currentindex],
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        artistNames[currentindex]!,
                        overflow: TextOverflow.ellipsis,
                      ),
                      tileColor: const Color.fromARGB(255, 250, 250, 251),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                indexes.remove(currentindex);
                              });
                              deleteSongFromFavorite(currentindex);
                              Fluttertoast.showToast(
                                msg: 'Song Removed from Favorites',
                                backgroundColor:
                                    const Color.fromARGB(255, 27, 164, 179),
                              );
                            },
                            icon: const Icon(Icons.delete_outline_rounded,
                                color: Colors.amber),
                          ),
                        ],
                      ), // set the background color based on the view mode
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List<int>> readFavoritedb() async {
    var favorite = await Hive.openBox<AllSongs>('allSongs');
    indexes.clear();
    for (int i = 0; i < favorite.length; i++) {
      var song = favorite.getAt(i);
      if (song != null) {
        indexes.add(song.songID);
      }
    }
    return indexes;
  }

  void clearFavoritedb() async {
    var favorite = await Hive.openBox<AllSongs>('allSongs');
    await favorite.clear();
  }
}

Future<void> deleteSongFromFavorite(int songID) async {
  var favorite = await Hive.openBox<AllSongs>('allSongs');
  for (int i = 0; i < favorite.length; i++) {
    var song = favorite.getAt(i);
    if (song != null && song.songID == songID) {
      await favorite.deleteAt(i);
      break;
    }
  }
}
