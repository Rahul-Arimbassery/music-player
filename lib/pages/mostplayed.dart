import 'package:flutter/material.dart';
import 'package:musicuitest/functions/recent.dart';

class MostPlayedPage extends StatefulWidget {
  const MostPlayedPage({super.key});

  @override
  State<MostPlayedPage> createState() => _MostPlayedPageState();
}

class _MostPlayedPageState extends State<MostPlayedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        title: const Text("Most Played",style: TextStyle(color: Color.fromARGB(255, 27, 164, 179),),),
      ),
      body: const RecentPageDisplay(),
    );
  }
}