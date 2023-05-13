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
        backgroundColor: Colors.white,
        title: const Text("Most Played",style: TextStyle(color: Colors.black),),
      ),
      body: const RecentPageDisplay(),
    );
  }
}