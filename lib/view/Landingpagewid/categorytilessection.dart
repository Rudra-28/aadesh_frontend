import 'package:flutter/material.dart';

class CategoryTilesSection extends StatefulWidget {
  const CategoryTilesSection({super.key});

  @override
  State<CategoryTilesSection> createState() => _CategoryTilesSectionState();
}

class _CategoryTilesSectionState extends State<CategoryTilesSection> {
  int? _hoveredIndex;

  final List<Map<String, String>> categories = [
    {
      'title': 'WEARABLES',
      'description': 'Celestial jewelry crafted for everyday elegance',
      'image': 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800&q=80',
    },
    {
      'title': 'ASTRO-HOME',
      'description': 'Transform your space with cosmic energy',
      'image': 'https://images.unsplash.com/photo-1616047006789-b7af5afb8c20?w=800&q=80',
    },
    {
      'title': 'CRYSTALS & STONES',
      'description': 'Natural healing stones for your spiritual journey',
      'image': 'https://images.unsplash.com/photo-1518281361980-b26bfd556770?w=800&q=80',
    },
  ];

  void _onCategoryTap(String category) {
    print('Tapped on $category');
    // Handle navigation or action here
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      color: const Color(0xFF0A0A0A),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            'EXPLORE COLLECTIONS',
            style: TextStyle(
              color: const Color(0xFFD4AF37),
              fontSize: isMobile ? 11 : 13,
              letterSpacing: 3,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            'Discover Our Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Category Tiles
          isMobile
              ? _buildMobileLayout()
              : isTablet
                  ? _buildTabletLayout()
                  : _buildDesktopLayout(),
        ],
      ),
    );
  }

  // Mobile Layout - Stacked vertically
  Widget _buildMobileLayout() {
    return Column(
      children: List.generate(
        categories.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildCategoryTile(index, double.infinity, 300),
        ),
      ),
    );
  }

  // Tablet Layout - 2 columns with third tile full width
  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCategoryTile(0, double.infinity, 350),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildCategoryTile(1, double.infinity, 350),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildCategoryTile(2, double.infinity, 350),
      ],
    );
  }

  // Desktop Layout - 3 columns
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        categories.length,
        (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? 20 : 0,
            ),
            child: _buildCategoryTile(index, double.infinity, 450),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(int index, double width, double height) {
    final category = categories[index];
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onTap: () => _onCategoryTap(category['title']!),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: isHovered
                  ? const Color(0xFFD4AF37)
                  : Colors.white.withOpacity(0.2),
              width: isHovered ? 2 : 1,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.network(
                category['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    child: const Icon(
                      Icons.image,
                      color: Colors.white24,
                      size: 64,
                    ),
                  );
                },
              ),

              // Gradient Overlay
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isHovered
                        ? [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.8),
                          ]
                        : [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.7),
                          ],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 400),
                        style: TextStyle(
                          color: isHovered
                              ? const Color(0xFFD4AF37)
                              : Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2,
                        ),
                        child: Text(category['title']!),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        category['description']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          height: 1.6,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Shop Link
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        child: Row(
                          children: [
                            Text(
                              'SHOP NOW',
                              style: TextStyle(
                                color: isHovered
                                    ? const Color(0xFFD4AF37)
                                    : Colors.white,
                                fontSize: 12,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              transform: Matrix4.translationValues(
                                isHovered ? 5 : 0,
                                0,
                                0,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: isHovered
                                    ? const Color(0xFFD4AF37)
                                    : Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
