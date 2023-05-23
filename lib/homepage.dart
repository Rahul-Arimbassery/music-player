import 'package:flutter/material.dart';
import 'package:musicuitest/globalpage.dart';
import 'package:musicuitest/screens/addplayltist.dart';
import 'package:musicuitest/screens/nowplaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  late List<bool> _isPressedList; // declare the _isPressedList variable
  bool _hasPermission = false;
  bool _isGrid = false; // new variable to keep track of the view mode

  @override
  void initState() {
    super.initState();
    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    _audioQuery.setLogConfig(logConfig);
    checkAndRequestPermissions();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    _hasPermission ? setState(() {}) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'All Songs',
              style: TextStyle(
                color: Color.fromARGB(255, 27, 164, 179),
              ),
            ),
            const SizedBox(
              width: 140,
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // Implement your search functionality here
              },
            ),
            IconButton(
              color: Colors.white,
              icon: _isGrid
                  ? const Icon(Icons.view_list)
                  : const Icon(Icons
                      .grid_view), // toggle the icon based on the view mode
              onPressed: () {
                setState(() {
                  _isGrid = !_isGrid; // toggle the view mode
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 251, 251, 252),
      body: SafeArea(
        child: Center(
          child: !_hasPermission
              ? noAccessToLibraryWidget()
              : FutureBuilder<List<SongModel>>(
                  future: fetchMP3Songs(),
                  builder: (context, item) {
                    if (item.hasError) {
                      return Text(item.error.toString());
                    }

                    if (item.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (item.data == null || item.data!.isEmpty) {
                      return const Text("No MP3 songs found!");
                    }

                    // Generate and initialize _isPressedList based on item.data length
                    _isPressedList =
                        List<bool>.filled(item.data!.length, false);

                    return _isGrid
                        ? _buildGridView(item)
                        : _buildListView(item);
                  },
                ),
        ),
      ),
    );
  }

  Future<List<SongModel>> fetchMP3Songs() async {
    List<SongModel> allSongs = await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );

    // Filter the songs to keep only MP3 files.
    List<SongModel> mp3Songs = allSongs.where((song) {
      String? filePath = song.data;
      return filePath.toLowerCase().endsWith('.mp3');
    }).toList();

    allfilePaths = mp3Songs.map((song) => song.data).toList();
    songNames = mp3Songs.map((song) => song.title).toList();
    artistNames = mp3Songs.map((song) => song.artist).toList();

    return mp3Songs;
  }

  Widget noAccessToLibraryWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 253, 251, 251).withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Application doesn't have access to the library"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => checkAndRequestPermissions(retry: true),
            child: const Text("Allow"),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(item) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                ListView.separated(
                  itemCount: item
                      .data!.length, // set the number of ListTiles to create
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height:
                          25.0, // set the desired height of the space between each ListTile
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          25.0), // set the desired border radius value
                      child: Card(
                        color: const Color.fromARGB(255, 252, 251, 251),
                        elevation: 10.0,
                        shadowColor: const Color.fromARGB(255, 252, 251, 251),
                        child: SizedBox(
                          height: 80.0, // set the desired height of the Card
                          width: double
                              .infinity, // set the width to match the parent ListView
                          child: InkWell(
                            onTap: () {  
                              _audioPlayer.stop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NowPlaying(
                                    index: index,
                                  ),
                                ),
                              );                             
                            },
                            child: ListTile(
                              leading: QueryArtworkWidget(
                                controller: _audioQuery,
                                id: item.data![index].id,
                                type: ArtworkType.AUDIO,
                              ),
                              title: Text(item.data![index].title),
                              subtitle:
                                  Text(item.data![index].artist ?? "No Artist"),
                              tileColor:
                                  const Color.fromARGB(255, 250, 250, 251),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPressedList[index] =
                                            !_isPressedList[index];
                                      });

                                      if (_isPressedList[index]) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Added to Favorites'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Removed from Favorites'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    icon: Container(
                                      color: _isPressedList[index]
                                          ? Colors.white
                                          : Colors.transparent,
                                      child: Icon(
                                        Icons.favorite,
                                        color: _isPressedList[index]
                                            ? const Color.fromARGB(
                                                255, 27, 164, 179)
                                            : const Color.fromARGB(
                                                255, 139, 135, 135),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddPlaylistPage(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.playlist_add),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(item) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 22,
              childAspectRatio: 0.80,
              children: List.generate(item.data!.length, (index) {
                return Material(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  elevation: 20, // add an elevation of 20
                  shadowColor: const Color.fromARGB(255, 123, 122, 119),
                  borderRadius: BorderRadius.circular(15.0),
                  child: InkWell(
                    onTap: () {
                      _audioPlayer.stop();
                      //Play using a miniplayer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NowPlaying(index: index),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 145, 145, 146),
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: QueryArtworkWidget(
                                controller: _audioQuery,
                                id: item.data![index].id,
                                type: ArtworkType.AUDIO,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.data![index].title),
                                const SizedBox(height: 8),
                                Text(item.data![index].artist ?? "No Artist"),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isPressedList[index] =
                                              !_isPressedList[index];
                                        });
                                      },
                                      icon: Container(
                                        color: _isPressedList[index]
                                            ? Colors.white
                                            : Colors.transparent,
                                        child: Icon(
                                          Icons.favorite,
                                          color: _isPressedList[index]
                                              ? const Color.fromARGB(
                                                  255, 27, 164, 179)
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddPlaylistPage(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.playlist_add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
