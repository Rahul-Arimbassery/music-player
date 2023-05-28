import 'package:flutter/material.dart';
import 'package:musicuitest/widgets/listview.dart';

class PlaylistDetailPage extends StatelessWidget {
  final String playlistName;

  const PlaylistDetailPage({super.key, required this.playlistName});

  //const PlaylistPage({super.key,this.playlistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text(playlistName),
      ),
      body: const ListViewPage(),
    );
  }
}
