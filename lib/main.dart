import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const StreakSpaceApp());
}

class StreakSpaceApp extends StatelessWidget {
  const StreakSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StreakSpace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}