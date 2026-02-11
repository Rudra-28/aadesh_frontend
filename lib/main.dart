import 'package:aadesh_frontend/view/landingpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AstrologyBraceletApp());
}

class AstrologyBraceletApp extends StatelessWidget {
  const AstrologyBraceletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrology Bracelet',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Serif',
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

