import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 class buildMainNavigation extends StatefulWidget {
  final Widget child;
  final dynamic isMobile;
 
  const buildMainNavigation({super.key, required this.isMobile, required this.child});

  @override
  State<buildMainNavigation> createState() => _buildMainNavigationState();
}

class _buildMainNavigationState extends State<buildMainNavigation> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.isMobile;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Text(
                ' AADESH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),

          if (!isMobile) ...[
            // Desktop Navigation
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNavItem('SHOP BY ZODIAC', '/shopbyzodiac'),
                  const SizedBox(width: 40),
                  buildNavItem('WEARABLES', '/wearables'),
                  const SizedBox(width: 40),
                  buildNavItem('ASTRO-HOME', '/astrohome'),
                  const SizedBox(width: 40),
                  buildNavItem('CRYSTALS & STONES', '/crystalstones'),
                ],
              ),
            ),

            // Right Side Icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 5),
                const Text(
                  'CART (0)',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            // Mobile Menu Icon
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: () {},
            ),
          ],
        ],
      ),
    );
  }
   Widget buildNavItem(String text, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
 

 