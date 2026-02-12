import 'package:flutter/material.dart';

class ZodiacSignsSection extends StatefulWidget {
  const ZodiacSignsSection({super.key});

  @override
  State<ZodiacSignsSection> createState() => _ZodiacSignsSectionState();
}

class _ZodiacSignsSectionState extends State<ZodiacSignsSection> {
  int? _hoveredIndex;

  final List<Map<String, String>> zodiacSigns = [
    {
      'name': 'ARIES',
      'symbol': '♈',
      'dates': 'Mar 21 - Apr 19',
      'element': 'Fire',
    },
    {
      'name': 'TAURUS',
      'symbol': '♉',
      'dates': 'Apr 20 - May 20',
      'element': 'Earth',
    },
    {
      'name': 'GEMINI',
      'symbol': '♊',
      'dates': 'May 21 - Jun 20',
      'element': 'Air',
    },
    {
      'name': 'CANCER',
      'symbol': '♋',
      'dates': 'Jun 21 - Jul 22',
      'element': 'Water',
    },
    {
      'name': 'LEO',
      'symbol': '♌',
      'dates': 'Jul 23 - Aug 22',
      'element': 'Fire',
    },
    {
      'name': 'VIRGO',
      'symbol': '♍',
      'dates': 'Aug 23 - Sep 22',
      'element': 'Earth',
    },
    {
      'name': 'LIBRA',
      'symbol': '♎',
      'dates': 'Sep 23 - Oct 22',
      'element': 'Air',
    },
    {
      'name': 'SCORPIO',
      'symbol': '♏',
      'dates': 'Oct 23 - Nov 21',
      'element': 'Water',
    },
    {
      'name': 'SAGITTARIUS',
      'symbol': '♐',
      'dates': 'Nov 22 - Dec 21',
      'element': 'Fire',
    },
    {
      'name': 'CAPRICORN',
      'symbol': '♑',
      'dates': 'Dec 22 - Jan 19',
      'element': 'Earth',
    },
    {
      'name': 'AQUARIUS',
      'symbol': '♒',
      'dates': 'Jan 20 - Feb 18',
      'element': 'Air',
    },
    {
      'name': 'PISCES',
      'symbol': '♓',
      'dates': 'Feb 19 - Mar 20',
      'element': 'Water',
    },
  ];

  Color _getElementColor(String element) {
    switch (element) {
      case 'Fire':
        return const Color(0xFFFF6B6B);
      case 'Earth':
        return const Color(0xFF8B7355);
      case 'Air':
        return const Color(0xFF87CEEB);
      case 'Water':
        return const Color(0xFF4A90E2);
      default:
        return const Color(0xFFD4AF37);
    }
  }

  void _onZodiacTap(String zodiacName) {
    // Handle zodiac sign tap
    print('Tapped on $zodiacName');
    // You can navigate to a detail page or show a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: Color(0xFFD4AF37), width: 1),
        ),
        title: Text(
          zodiacName,
          style: const TextStyle(
            color: Color(0xFFD4AF37),
            letterSpacing: 2,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Explore our exclusive $zodiacName collection.\nHandcrafted bracelets designed for your celestial energy.',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'CLOSE',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                letterSpacing: 1.5,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print('Shop $zodiacName collection');
            },
            child: const Text(
              'SHOP NOW',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    // Determine grid columns based on screen size
    int crossAxisCount;
    if (isMobile) {
      crossAxisCount = 2;
    } else if (isTablet) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            'DISCOVER YOUR SIGN',
            style: TextStyle(
              color: const Color(0xFFD4AF37),
              fontSize: isMobile ? 11 : 13,
              letterSpacing: 3,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            'Choose Your Zodiac',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          Text(
            'Each sign carries its own unique energy and story',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w300,
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Zodiac Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 15 : 20,
              mainAxisSpacing: isMobile ? 15 : 20,
              childAspectRatio: isMobile ? 0.85 : 0.9,
            ),
            itemCount: zodiacSigns.length,
            itemBuilder: (context, index) {
              final zodiac = zodiacSigns[index];
              final isHovered = _hoveredIndex == index;

              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = null),
                child: GestureDetector(
                  onTap: () => _onZodiacTap(zodiac['name']!),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isHovered
                          ? Colors.white.withOpacity(0.05)
                          : Colors.transparent,
                      border: Border.all(
                        color: isHovered
                            ? const Color(0xFFD4AF37)
                            : Colors.white.withOpacity(0.2),
                        width: isHovered ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Zodiac Symbol
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: isHovered
                                ? (isMobile ? 60 : 72)
                                : (isMobile ? 52 : 64),
                            color: isHovered
                                ? const Color(0xFFD4AF37)
                                : Colors.white70,
                          ),
                          child: Text(zodiac['symbol']!),
                        ),
                        SizedBox(height: isMobile ? 10 : 15),

                        // Zodiac Name
                        Text(
                          zodiac['name']!,
                          style: TextStyle(
                            color: isHovered
                                ? const Color(0xFFD4AF37)
                                : Colors.white,
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: isMobile ? 5 : 8),

                        // Dates
                        Text(
                          zodiac['dates']!,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: isMobile ? 10 : 11,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: isMobile ? 8 : 10),

                        // Element Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getElementColor(zodiac['element']!)
                                .withOpacity(0.2),
                            border: Border.all(
                              color: _getElementColor(zodiac['element']!)
                                  .withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            zodiac['element']!.toUpperCase(),
                            style: TextStyle(
                              color: _getElementColor(zodiac['element']!),
                              fontSize: isMobile ? 9 : 10,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
