import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:musicuitest/splash.dart';
import 'models/allsongs.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Check if AllSongsAdapter is registered
  if (!Hive.isAdapterRegistered(AllSongsAdapter().typeId)) {
    Hive.registerAdapter(AllSongsAdapter());
  }

  await Hive.openBox<AllSongs>('allSongs');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 250, 250, 251),
      ),
    );
  }
}
