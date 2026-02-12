import 'package:aadesh_frontend/view/constant/herosection.dart';
import 'package:aadesh_frontend/view/homecontent/categorytilessection.dart';
import 'package:aadesh_frontend/view/homecontent/featuredproductscarousel.dart';
import 'package:aadesh_frontend/view/homecontent/zodiacsignsection.dart';
import 'package:flutter/material.dart';
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    return Column(
      children: [
        buildheroSection(isMobile: isMobile),
        const ZodiacSignsSection(),
        const CategoryTilesSection(),
        const FeaturedProductsCarousel(),
      ],
    );
  }
}