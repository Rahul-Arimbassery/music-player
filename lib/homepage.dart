import 'package:flutter/material.dart';
import 'package:musicuitest/pages/addplayltist.dart';
//import 'package:musicuitest/pages/miniplayer.dart';
import 'package:musicuitest/pages/nowplaying.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  bool _isGrid = false; // new variable to keep track of the view mode
  List<bool> _isPressedList =
      List.generate(12, (_) => false); // Assuming you have 12 ListTiles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
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
                  itemCount: 12, // set the number of ListTiles to create
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NowPlaying()),
                              );
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
                                  // IconButton(
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _isPressedList[index] =
                                  //           !_isPressedList[index];
                                  //     });
                                  //   },
                                  //   icon: Container(
                                  //     color: _isPressedList[index]
                                  //         ? Colors.white
                                  //         : Colors.transparent,
                                  //     child: Icon(
                                  //       Icons.favorite,
                                  //       color: _isPressedList[index]
                                  //           ? const Color.fromARGB(255, 27, 164, 179)
                                  //           : Colors.grey,
                                  //     ),
                                  //   ),
                                  // ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NowPlaying()),
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
//---------------------------------------------------------------------------------------------


