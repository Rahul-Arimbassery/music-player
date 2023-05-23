// import 'package:flutter/material.dart';
// import 'package:musicuitest/widgets/listview.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: const Color.fromARGB(255, 27, 164, 179),
//         elevation: 10,
//         backgroundColor: Colors.black,
//         title: const Text("Favorite Songs",style: TextStyle(color: Color.fromARGB(255, 27, 164, 179),),),
//       ),
//       body: const ListViewPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:musicuitest/widgets/listview.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool hasFavoriteSongs =
      false; // Set this flag based on whether there are favorite songs or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        title: const Text(
          "Favorite Songs",
          style: TextStyle(color: Color.fromARGB(255, 27, 164, 179)),
        ),
      ),
      body: hasFavoriteSongs
          ? const ListViewPage() // Display your list of favorite songs using the ListViewWidget
          : const Center(
              child: Text(
                'No favorite songs available.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
