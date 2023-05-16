import 'package:flutter/material.dart';
import 'package:musicuitest/functions/listview.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        title: const Text("Favorite Songs",style: TextStyle(color: Color.fromARGB(255, 27, 164, 179),),),
      ),
      body: const ListViewPage(),
    );
  }
}