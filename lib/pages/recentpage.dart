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
        backgroundColor: Colors.white,
        title: const Text("Recent Songs",style: TextStyle(color: Colors.black),),       
      ),
      body: const RecentPageDisplay(),
    );
  }
}