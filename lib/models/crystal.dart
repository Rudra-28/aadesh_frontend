import 'package:flutter/material.dart';

class Crystal {
  final String name;
  final String property;
  final String imageUrl;

  Crystal({required this.name, required this.property, required this.imageUrl});
}

final List<Crystal> crystalList = [
  Crystal(name: 'Amethyst', property: 'Calm & Intuition', imageUrl: 'https://images.unsplash.com/photo-1567606401042-53d9e07908b9?w=400'),
  Crystal(name: 'Rose Quartz', property: 'Love & Compassion', imageUrl: 'https://images.unsplash.com/photo-1615111784767-4d7a407d35ec?w=400'),
  Crystal(name: 'Citrine', property: 'Abundance & Energy', imageUrl: 'https://images.unsplash.com/photo-1614352126463-5481d636b00b?w=400'),
  Crystal(name: 'Clear Quartz', property: 'Clarity & Healing', imageUrl: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=400'),
];