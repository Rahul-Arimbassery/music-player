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
      backgroundColor: const Color.fromARGB(255, 251, 251, 252),
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_currentIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 210, 212, 210),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mini Player',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  IconButton(
                    onPressed: () {
                      // Implement previous button functionality here
                    },
                    icon: const Icon(Icons.skip_previous),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement play button functionality here
                    },
                    icon: const Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement next button functionality here
                    },
                    icon: const Icon(Icons.skip_next),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 248, 247, 245),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
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
