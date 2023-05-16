// import 'package:flutter/material.dart';
// import 'package:musicuitest/homepage.dart';
// import 'package:musicuitest/pages/favoritepage.dart';
// import 'package:musicuitest/pages/mostplayed.dart';
// import 'package:musicuitest/pages/playlistpage.dart';
// import 'package:musicuitest/pages/recentpage.dart';
// import 'package:musicuitest/pages/settingpage.dart';

// class NavigatorPage extends StatefulWidget {
//   const NavigatorPage({super.key});

//   @override
//   State<NavigatorPage> createState() => _NavigatorPageState();
// }

// class _NavigatorPageState extends State<NavigatorPage> {

//   final List<Widget> _pages = [
//   const HomePage(), // Add your home page widget here
//   const FavoritePage(), // Add your favorite page widget here
//   const RecentPage(), // Add your recent page widget here
//   const PlaylistPage(), // Add your playlist page widget here
//   const MostPlayedPage(), // Add your most played page widget here
//   const SettingsPage(), // Add your settings page widget here
// ];

//   //bool _isGrid = false;
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 251, 251, 252),
//       body: SafeArea(
//         child: _pages[_currentIndex],
//       ),
//             bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         backgroundColor: const Color.fromARGB(255, 248, 247, 245),
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.music_note),
//             label: 'Recent',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.playlist_add_check),
//             label: 'Playlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.play_circle_rounded),
//             label: 'Most Played',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

//-----------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:musicuitest/homepage.dart';
// import 'package:musicuitest/pages/favoritepage.dart';
// import 'package:musicuitest/pages/mostplayed.dart';
// import 'package:musicuitest/pages/playlistpage.dart';
// import 'package:musicuitest/pages/recentpage.dart';
// import 'package:musicuitest/pages/settingpage.dart';

// class NavigatorPage extends StatefulWidget {
//   const NavigatorPage({Key? key}) : super(key: key);

//   @override
//   State<NavigatorPage> createState() => _NavigatorPageState();
// }

// class _NavigatorPageState extends State<NavigatorPage> {
//   final List<Widget> _pages = [
//     const HomePage(), // Add your home page widget here
//     const FavoritePage(), // Add your favorite page widget here
//     const RecentPage(), // Add your recent page widget here
//     const PlaylistPage(), // Add your playlist page widget here
//     const MostPlayedPage(), // Add your most played page widget here
//     const SettingsPage(), // Add your settings page widget here
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 251, 251, 252),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 100,
//               color:
//                   Colors.blue, // Customize the container properties as needed
//               child: Center(
//                 child: Text(
//                   'Fixed Container',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: _pages[_currentIndex],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         backgroundColor: const Color.fromARGB(255, 248, 247, 245),
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.music_note),
//             label: 'Recent',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.playlist_add_check),
//             label: 'Playlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.play_circle_rounded),
//             label: 'Most Played',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:musicuitest/homepage.dart';
import 'package:musicuitest/pages/favoritepage.dart';
import 'package:musicuitest/pages/mostplayed.dart';
import 'package:musicuitest/pages/playlistpage.dart';
import 'package:musicuitest/pages/recentpage.dart';
import 'package:musicuitest/pages/settingpage.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final List<Widget> _pages = [
    const HomePage(), // Add your home page widget here
    const FavoritePage(), // Add your favorite page widget here
    const RecentPage(), // Add your recent page widget here
    const PlaylistPage(), // Add your playlist page widget here
    const MostPlayedPage(), // Add your most played page widget here
    const SettingsPage(), // Add your settings page widget here
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 18,
              right: 210,  // for emulator
              top: 1,
              child: Container(
                height: 55,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 251, 251),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'MeloPlay',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              //left: 130,  //for mobile
              left: 180,  //for emulator
              right: 0,
              top: 10,
              child: Container(
                height: 55,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 5, 5),
                  //color: Color.fromARGB(255, 84, 120, 117),
                  borderRadius: BorderRadius.only(
                    //bottomLeft: Radius.circular(30),
                    //bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    '🪘  🪕  🎸  🎶  🎷  🎺',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 6, 6, 6),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 55,
              child: _pages[_currentIndex],
            ),
            Positioned(
              left: 18,
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 27, 164, 179),
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      'Mini Player',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement previous button functionality here
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement play button functionality here
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement next button functionality here
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement next button functionality here
                      },
                      icon: const Icon(
                        Icons.close_outlined,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 27, 164, 179),
        unselectedItemColor: const Color.fromARGB(255, 5, 5, 5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_rounded),
            label: 'Most Played',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
