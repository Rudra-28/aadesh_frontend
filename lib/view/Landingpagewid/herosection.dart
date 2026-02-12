import 'package:flutter/material.dart';

// ignore: camel_case_types
class buildheroSection extends StatefulWidget {
  final bool isMobile;

  const buildheroSection({super.key, required this.isMobile});

  @override
  State<buildheroSection> createState() => _buildheroSectionState();
}

class _buildheroSectionState extends State<buildheroSection> {
  @override
  Widget build(BuildContext context) {
    bool isHoveringExplore = false;
    bool isHoveringLookbook = false;
    final bool isMobile = widget.isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Subtitle
          Text(
            'THE CELESTIAL COLLECTION',
            style: TextStyle(
              color: const Color(0xFFD4AF37),
              fontSize: isMobile ? 11 : 13,
              letterSpacing: 3,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),

          // Main Heading
          Text(
            'Align Your Space.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 48 : 80,
              fontWeight: FontWeight.w300,
              height: 1.1,
              letterSpacing: 1,
            ),
          ),
          Text(
            'Wear Your Stars.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 48 : 80,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              height: 1.1,
              letterSpacing: 1,
            ),
          ),

          SizedBox(height: isMobile ? 50 : 80),

          // CTA Buttons
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              buildCTAButton(
                'EXPLORE COLLECTION',
                isPrimary: true,
                isHovering: isHoveringExplore,
                onHover: (hovering) {
                  setState(() => isHoveringExplore = hovering);
                },
              ),
              buildCTAButton(
                'VIEW LOOKBOOK',
                isPrimary: false,
                isHovering: isHoveringLookbook,
                onHover: (hovering) {
                  setState(() => isHoveringLookbook = hovering);
                },
              ),
            ],
          ),

          SizedBox(height: isMobile ? 80 : 120),

          // Scroll Indicator
          Column(
            children: [
              Text(
                'SCROLL',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white.withOpacity(0.6),
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildCTAButton(
  String text, {
  required bool isPrimary,
  required bool isHovering,
  required Function(bool) onHover,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => onHover(true),
    onExit: (_) => onHover(false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      decoration: BoxDecoration(
        color: isPrimary
            ? (isHovering ? Colors.white : Colors.white.withOpacity(0.95))
            : (isHovering ? Colors.white.withOpacity(0.1) : Colors.transparent),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isPrimary && !isHovering ? Colors.black : Colors.white,
          fontSize: 13,
          letterSpacing: 2,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
