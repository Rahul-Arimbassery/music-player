// import 'package:flutter/material.dart';

// class MiniPlayer extends StatelessWidget {
//   const MiniPlayer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Container(
//         width: 350,
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: const Color.fromARGB(255, 233, 230, 230),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 15),
//             const Text("Song Name"),
//             const SizedBox(width: 20),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.skip_previous),
//             ),
//             const SizedBox(width: 5),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.play_arrow),
//             ),
//             const SizedBox(width: 5),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.skip_next),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 251, 251),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 7),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
          const SizedBox(width: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Song Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Artist Name',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_previous),
            iconSize: 25,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}
