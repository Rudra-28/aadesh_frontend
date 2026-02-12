import 'package:aadesh_frontend/view/constant/buildmainnav.dart';
import 'package:aadesh_frontend/view/constant/buildtopbar.dart';
import 'package:aadesh_frontend/view/constant/footer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Widget child; // The sub-page (HomeContent, ShopByZodiac, or Wearables)
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    return Scaffold(
      body: Stack(
        children: [
          // Background remains global
          const BackgroundImage(),
          
          SingleChildScrollView(
            child: Column(
              children: [
                const TopBar(),
                buildMainNavigation(isMobile: isMobile, child: child),
                
                // This is where HomeContent OR ShopByZodiac appears
                child, 

                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          );
  }
}