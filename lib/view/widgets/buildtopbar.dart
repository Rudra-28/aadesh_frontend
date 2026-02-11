  import 'package:flutter/material.dart';
  Widget buildTopBar() {
    return Container(
      height: 40,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          buildTopBarItem('MONEY MAGNET'),
          buildTopBarItem('LUXURY BRACELET'),
          buildTopBarItem('VIRGO BLOOM STUDS'),
          buildTopBarItem('LIBRA BALANCE CUFF'),
          buildTopBarItem('SCORPIO MYSTIC BAND'),
          buildTopBarItem('SAGITTARIUS ARCHER LINK'),
          buildTopBarItem('CAPRICORN PEAK STONE'),
        ],
      ),
    );
  }

  
  Widget buildTopBarItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }