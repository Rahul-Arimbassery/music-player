import 'package:flutter/material.dart';
import 'package:musicuitest/screens/addplayltist.dart';
//import 'package:musicuitest/pages/miniplayer.dart';
import 'package:musicuitest/screens/nowplaying.dart';

class PlayListItems extends StatefulWidget {
  
  const PlayListItems({super.key});

  @override
  State<PlayListItems> createState() => _PlayListItemsState();
}

class _PlayListItemsState extends State<PlayListItems> {

  // int _currentIndex = 0;
  bool _isGrid = false; // new variable to keep track of the view mode
  List<bool> _isPressedList =
      List.generate(12, (_) => false); // Assuming you have 12 ListTiles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 252),
      body: SafeArea(
        child: _isGrid ? _buildGridView() : _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                ListView.separated(
                  itemCount: 2, // set the number of ListTiles to create
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
                          height: 70.0, // set the desired height of the Card
                          width: double
                              .infinity, // set the width to match the parent ListView
                          child: InkWell(
                            onTap: () {
                              //Play using a miniplayer
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const NowPlaying()),
                              // );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const MiniPlayer()),
                              // );

                              // showDialog(
                              //   context: context,
                              //   barrierDismissible: true,
                              //   builder: (BuildContext context) {
                              //     return Semantics(
                              //       child: Stack(
                              //         children: const [
                              //           Positioned(
                              //             top: 440,
                              //             right: 0,
                              //             left: 0,
                              //             child: AlertDialog(
                              //               backgroundColor: Color.fromARGB(
                              //                   255, 254, 254, 253),
                              //               content: MiniPlayer(),
                              //               actions: [],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              // );
                            },
                            child: ListTile(
                              leading: Image.asset(
                                  "asset/images/music-band.png",
                                  scale: Checkbox.width),
                              title: Text('Song ${index + 1}'),
                              subtitle:
                                  Text('Description of item ${index + 1}'),
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
                                    },
                                    icon: Container(
                                      color: _isPressedList[index]
                                          ? Colors.white
                                          : Colors.transparent,
                                      child: Icon(
                                        Icons.favorite,
                                        color: _isPressedList[index]
                                            ? const Color.fromARGB(255, 27, 164, 179)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      //need to delete
                                    },
                                    icon: const Icon(Icons.delete),
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

  Widget _buildGridView() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              childAspectRatio: 0.80,
              children: List.generate(12, (index) {
                return Material(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  elevation: 20, // add an elevation of 20
                  shadowColor: const Color.fromARGB(255, 123, 122, 119),
                  borderRadius: BorderRadius.circular(15.0),
                  child: InkWell(
                    onTap: () {
                      //Play using a miniplayer
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const NowPlaying()),
                      // );
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
                              child: Image.asset(
                                "asset/images/music-band.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Song ${index + 1}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Description of item ${index + 1}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 5, 5, 5),
                                  ),
                                ),
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
                                              ? Colors.red
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
                                      icon: const Icon(Icons.delete),
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
//---------------------------------------------------------------------------------------------


