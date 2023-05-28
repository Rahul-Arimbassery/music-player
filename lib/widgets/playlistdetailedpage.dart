// import 'package:flutter/material.dart';
// import 'package:musicuitest/widgets/playlistitems.dart';
// import 'package:musicuitest/widgets/recent.dart';

// class PlaylistDetailsPage extends StatelessWidget {
//   final String playlistName;
//   final VoidCallback onClose;

//   const PlaylistDetailsPage({
//     required this.playlistName,
//     required this.onClose,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           playlistName,
//           style: const TextStyle(color: Colors.black),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: onClose,
//           color: Colors.black,
//         ),
//       ),
//       body: const PlayListItems(),
//     );
//   }
// }
