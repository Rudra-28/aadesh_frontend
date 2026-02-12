import 'package:flutter/material.dart';

class ShopByZodiacPage extends StatelessWidget {
  const ShopByZodiacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Shop By Zodiac",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
