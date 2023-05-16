import 'package:flutter/material.dart';
import 'package:musicuitest/functions/listview.dart';
import 'package:musicuitest/functions/recent.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 27, 164, 179),
        elevation: 10,
        backgroundColor: Colors.black,
        title: const Text("Recent Songs",style: TextStyle(color: Color.fromARGB(255, 27, 164, 179),),),       
      ),
      body: const RecentPageDisplay(),
    );
  }
}