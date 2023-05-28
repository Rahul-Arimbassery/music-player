import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musicuitest/globalpage.dart';
import 'package:musicuitest/screens/nowplaying.dart';
import 'package:musicuitest/screens/playlistpage.dart';
import 'package:on_audio_query/on_audio_query.dart';

final OnAudioQuery _audioQuery = OnAudioQuery();

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 61, 61, 58),
            Color.fromARGB(255, 254, 254, 253),
          ],
          center: Alignment.topLeft,
          radius: 1.2,
        )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: indexesPlaylist.isEmpty
              ? const Center(
                  child: Text(
                    'No items in playlist.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              : ListView.separated(
            itemCount: indexesPlaylist.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height:
                    4, // set the desired height of the space between each ListTile
              );
            },
            itemBuilder: (context, index) {
              int currentindex = indexesPlaylist[index]; //updating index here
              return ClipRRect(
                borderRadius: BorderRadius.circular(
                    25.0), // set the desired border radius value
                child: Card(
                  color: const Color.fromARGB(255, 190, 188, 188),
                  elevation: 3.0,
                  shadowColor: const Color.fromARGB(255, 188, 184, 184),
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
                                  indexesPlaylist.remove(currentindex);
                                });
                                Fluttertoast.showToast(
                                  msg: 'Song Removed from Playlist',
                                  backgroundColor:
                                      const Color.fromARGB(255, 27, 164, 179),
                                );
                              },
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Color.fromARGB(255, 27, 164, 179),
                              ),
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
      ),
    );
  }
}
