import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final TextEditingController _emailController = TextEditingController();
  bool _isHoveringSubscribe = false;
  String? _hoveredLink;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _subscribeNewsletter() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showMessage('Please enter your email address', isError: true);
      return;
    }

    if (!_isValidEmail(email)) {
      _showMessage('Please enter a valid email address', isError: true);
      return;
    }

    // Handle newsletter subscription
    print('Subscribing email: $email');

    _showMessage('Thank you for subscribing to our newsletter!');
    _emailController.clear();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: isError ? Colors.red[900] : Colors.black87,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: isError ? Colors.red : const Color(0xFFD4AF37),
            width: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      color: const Color(0xFF0A0A0A),
      child: Column(
        children: [
          // Main Footer Content
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: isMobile ? 60 : 80,
            ),
            child: isMobile
                ? _buildMobileFooter()
                : isTablet
                    ? _buildTabletFooter()
                    : _buildDesktopFooter(),
          ),

          // Divider
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            color: Colors.white.withOpacity(0.1),
          ),

          // Bottom Bar
          _buildBottomBar(isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Section (40%)
        Expanded(
          flex: 4,
          child: _buildBrandSection(),
        ),
        const SizedBox(width: 60),

        // Shop Links (20%)
        Expanded(
          flex: 2,
          child: _buildLinkSection(
            'SHOP',
            [
              'All Products',
              'Wearables',
              'Astro-Home',
              'Crystals & Stones',
              'Gift Cards',
              'Sale',
            ],
          ),
        ),

        // About Links (20%)
        Expanded(
          flex: 2,
          child: _buildLinkSection(
            'ABOUT',
            [
              'Our Story',
              'Craftsmanship',
              'Sustainability',
              'Reviews',
              'Blog',
              'Contact Us',
            ],
          ),
        ),

        // Support Links (20%)
        Expanded(
          flex: 2,
          child: _buildLinkSection(
            'SUPPORT',
            [
              'Shipping & Returns',
              'Size Guide',
              'Care Instructions',
              'FAQ',
              'Track Order',
              'Privacy Policy',
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletFooter() {
    return Column(
      children: [
        _buildBrandSection(),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLinkSection(
                'SHOP',
                [
                  'All Products',
                  'Wearables',
                  'Astro-Home',
                  'Crystals & Stones',
                  'Gift Cards',
                  'Sale',
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: _buildLinkSection(
                'ABOUT',
                [
                  'Our Story',
                  'Craftsmanship',
                  'Sustainability',
                  'Reviews',
                  'Blog',
                  'Contact Us',
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: _buildLinkSection(
                'SUPPORT',
                [
                  'Shipping & Returns',
                  'Size Guide',
                  'Care Instructions',
                  'FAQ',
                  'Track Order',
                  'Privacy Policy',
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandSection(),
        const SizedBox(height: 40),
        _buildLinkSection(
          'SHOP',
          [
            'All Products',
            'Wearables',
            'Astro-Home',
            'Crystals & Stones',
            'Gift Cards',
            'Sale',
          ],
        ),
        const SizedBox(height: 30),
        _buildLinkSection(
          'ABOUT',
          [
            'Our Story',
            'Craftsmanship',
            'Sustainability',
            'Reviews',
            'Blog',
            'Contact Us',
          ],
        ),
        const SizedBox(height: 30),
        _buildLinkSection(
          'SUPPORT',
          [
            'Shipping & Returns',
            'Size Guide',
            'Care Instructions',
            'FAQ',
            'Track Order',
            'Privacy Policy',
          ],
        ),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Row(
          children: const [
            Text(
              'ASTROLOGY ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
            Text(
              'BRACELET',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 20,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Tagline
        Text(
          'Handcrafted celestial jewelry designed to align your energy with the cosmos.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            height: 1.6,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 30),

        // Newsletter Section
        const Text(
          'STAY CONNECTED',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Subscribe to receive updates, access to exclusive deals, and more.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 13,
            height: 1.5,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 20),

        // Email Input
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _emailController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Color(0xFFD4AF37),
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHoveringSubscribe = true),
              onExit: (_) => setState(() => _isHoveringSubscribe = false),
              child: GestureDetector(
                onTap: _subscribeNewsletter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: _isHoveringSubscribe
                        ? const Color(0xFFD4AF37)
                        : Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'SUBSCRIBE',
                    style: TextStyle(
                      color: _isHoveringSubscribe
                          ? Colors.black
                          : const Color(0xFFD4AF37),
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Social Media Icons
        const Text(
          'FOLLOW US',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, 'Facebook'),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.camera_alt, 'Instagram'),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.photo_camera, 'Pinterest'),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.chat_bubble_outline, 'Twitter'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String platform) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => print('Navigate to $platform'),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white.withOpacity(0.7),
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildLinkSection(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map((link) => _buildFooterLink(link)),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    final isHovered = _hoveredLink == text;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hoveredLink = text),
        onExit: (_) => setState(() => _hoveredLink = null),
        child: GestureDetector(
          onTap: () => print('Navigate to $text'),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: isHovered
                  ? const Color(0xFFD4AF37)
                  : Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5,
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 25 : 30,
      ),
      child: isMobile
          ? Column(
              children: [
                Text(
                  '© 2026 Astrology Bracelet. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBottomLink('Terms of Service'),
                    Text(
                      ' • ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    _buildBottomLink('Privacy Policy'),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2026 Astrology Bracelet. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                Row(
                  children: [
                    _buildBottomLink('Terms of Service'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '•',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    _buildBottomLink('Privacy Policy'),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildBottomLink(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => print('Navigate to $text'),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
