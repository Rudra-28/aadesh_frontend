import 'package:flutter/material.dart';

class Wearables extends StatelessWidget {

  const Wearables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Wearables",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
