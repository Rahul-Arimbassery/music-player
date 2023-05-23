// import 'package:flutter/material.dart';
// import 'package:musicuitest/widgets/playlistdetailedpage.dart';

// class PlaylistPage extends StatefulWidget {
//   const PlaylistPage({Key? key}) : super(key: key);

//   @override
//   State<PlaylistPage> createState() => _PlaylistPageState();
// }

// class _PlaylistPageState extends State<PlaylistPage> {
//   bool isDetailsPageVisible = false;
//   late String selectedPlaylistName;

//   void openDetailsPage(String playlistName) {
//     setState(() {
//       isDetailsPageVisible = true;
//       selectedPlaylistName = playlistName;
//     });
//   }

//   void closeDetailsPage() {
//     setState(() {
//       isDetailsPageVisible = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: const Color.fromARGB(255, 27, 164, 179),
//         elevation: 10,
//         backgroundColor: Colors.black,
//         title: const Text(
//           "Play List",
//           style: TextStyle(color: Color.fromARGB(255, 27, 164, 179),),
//         ),
//       ),
//       body: isDetailsPageVisible
//           ? PlaylistDetailsPage(
//               playlistName: selectedPlaylistName,
//               onClose: closeDetailsPage,
//             )
//           : Padding(
//               padding: const EdgeInsets.only(left:60.0,top: 30,),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () => openDetailsPage('Playlist 1'),
//                         child: Container(
//                           height: 140,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color.fromARGB(255, 235, 238, 235),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset("asset/images/music-band.png"),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Playlist 1',
//                                       style: TextStyle(color: Colors.black)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       InkWell(
//                         onTap: () => openDetailsPage('Playlist 2'),
//                         child: Container(
//                           height: 140,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color.fromARGB(255, 235, 238, 235),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset("asset/images/music-band.png"),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Playlist 2',
//                                       style: TextStyle(color: Colors.black)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () => openDetailsPage('Playlist 3'),
//                         child: Container(
//                           height: 140,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color.fromARGB(255, 235, 238, 235),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset("asset/images/music-band.png"),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Playlist 3',
//                                       style: TextStyle(color: Colors.black)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       InkWell(
//                         onTap:() => openDetailsPage('Playlist 4'),
//                         child: Container(
//                           height: 140,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color.fromARGB(255, 235, 238, 235),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset("asset/images/music-band.png"),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Playlist 4',
//                                       style: TextStyle(color: Colors.black)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:musicuitest/screens/addplayltist.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        title: const Text(
          "Playlist",
          style: TextStyle(color: Color.fromARGB(255, 27, 164, 179)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No Playlist created.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlaylistPage(),
                  ),
                );
              },
              child: const Text('Create Playlist'),
            ),
          ],
        ),
      ),
    );
  }
}
