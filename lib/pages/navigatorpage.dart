import 'package:flutter/material.dart';
import 'package:musicuitest/homepage.dart';
import 'package:musicuitest/pages/favoritepage.dart';
import 'package:musicuitest/pages/mostplayed.dart';
import 'package:musicuitest/pages/playlistpage.dart';
import 'package:musicuitest/pages/recentpage.dart';
import 'package:musicuitest/pages/settingpage.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});


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

  //bool _isGrid = false;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 252),
      body: SafeArea(
        child: _pages[_currentIndex],
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
