import 'package:aadesh_frontend/view/widgets/buildmainnav.dart';
import 'package:aadesh_frontend/view/widgets/buildtopbar.dart';
import 'package:aadesh_frontend/view/widgets/herosection.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1532693322450-2cb5c511067d?w=1920&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.6),
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Top Navigation Bar
                buildTopBar(),

                // Main Navigation
                buildMainNavigation(isMobile: isMobile),

                // Hero Section
                buildheroSection(isMobile: isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
