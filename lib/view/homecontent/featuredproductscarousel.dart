import 'package:flutter/material.dart';

class FeaturedProductsCarousel extends StatefulWidget {
  const FeaturedProductsCarousel({super.key});

  @override
  State<FeaturedProductsCarousel> createState() =>
      _FeaturedProductsCarouselState();
}

class _FeaturedProductsCarouselState extends State<FeaturedProductsCarousel> {
  final ScrollController _scrollController = ScrollController();
  int? _hoveredIndex;
  final List<int> _cartItems = [];

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Aries Fire Bracelet',
      'price': 89.99,
      'zodiac': 'ARIES',
      'image':
          'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=500&q=80',
      'description': 'Bold and energetic design for the fearless leader',
    },
    {
      'id': 2,
      'name': 'Taurus Earth Cuff',
      'price': 129.99,
      'zodiac': 'TAURUS',
      'image':
          'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=500&q=80',
      'description': 'Grounded elegance for the steady soul',
    },
    {
      'id': 3,
      'name': 'Gemini Air Chain',
      'price': 99.99,
      'zodiac': 'GEMINI',
      'image':
          'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=500&q=80',
      'description': 'Versatile design for the social butterfly',
    },
    {
      'id': 4,
      'name': 'Cancer Water Ring',
      'price': 109.99,
      'zodiac': 'CANCER',
      'image':
          'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500&q=80',
      'description': 'Emotional depth in moonstone and silver',
    },
    {
      'id': 5,
      'name': 'Leo Sun Medallion',
      'price': 149.99,
      'zodiac': 'LEO',
      'image':
          'https://images.unsplash.com/photo-1506630448388-4e683c67ddb0?w=500&q=80',
      'description': 'Radiant gold for the born leader',
    },
    {
      'id': 6,
      'name': 'Virgo Precision Band',
      'price': 94.99,
      'zodiac': 'VIRGO',
      'image':
          'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=500&q=80',
      'description': 'Minimalist perfection for the detail-oriented',
    },
    {
      'id': 7,
      'name': 'Libra Balance Bracelet',
      'price': 119.99,
      'zodiac': 'LIBRA',
      'image':
          'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=500&q=80',
      'description': 'Harmonious design for the peacemaker',
    },
    {
      'id': 8,
      'name': 'Scorpio Mystic Stone',
      'price': 139.99,
      'zodiac': 'SCORPIO',
      'image':
          'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=500&q=80',
      'description': 'Deep black onyx for the mysterious soul',
    },
  ];

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartItems.add(product['id']);
    });

    // Show snackbar confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Color(0xFFD4AF37)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${product['name']} added to cart',
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: Color(0xFFD4AF37), width: 1),
        ),
      ),
    );

    print('Added to cart: ${product['name']} - \$${product['price']}');
    print('Total items in cart: ${_cartItems.length}');
  }

  bool _isInCart(int productId) {
    return _cartItems.contains(productId);
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 350,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 350,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          // Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            child: Column(
              children: [
                Text(
                  'BESTSELLERS',
                  style: TextStyle(
                    color: const Color(0xFFD4AF37),
                    fontSize: isMobile ? 11 : 13,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: isMobile ? 15 : 20),
                Text(
                  'Featured Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 36 : 48,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: isMobile ? 10 : 15),
                Text(
                  'Handcrafted bracelets designed with celestial precision',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w300,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Carousel with Navigation Arrows
          Stack(
            alignment: Alignment.center,
            children: [
              // Product Carousel
              SizedBox(
                height: isMobile ? 420 : 500,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 60,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: isMobile ? 15 : 20,
                      ),
                      child: _buildProductCard(
                        products[index],
                        index,
                        isMobile,
                      ),
                    );
                  },
                ),
              ),

              // Navigation Arrows (Desktop only)
              if (!isMobile) ...[
                Positioned(
                  left: 10,
                  child: _buildNavigationButton(
                    Icons.arrow_back_ios,
                    _scrollLeft,
                  ),
                ),
                Positioned(
                  right: 10,
                  child: _buildNavigationButton(
                    Icons.arrow_forward_ios,
                    _scrollRight,
                  ),
                ),
              ],
            ],
          ),

          // Cart Summary (if items in cart)
          if (_cartItems.isNotEmpty) ...[
            SizedBox(height: isMobile ? 30 : 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFD4AF37),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag,
                          color: Color(0xFFD4AF37),
                          size: 24,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          '${_cartItems.length} ${_cartItems.length == 1 ? 'ITEM' : 'ITEMS'} IN CART',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        print('View cart clicked');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        backgroundColor: const Color(0xFFD4AF37),
                      ),
                      child: const Text(
                        'VIEW CART',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProductCard(
    Map<String, dynamic> product,
    int index,
    bool isMobile,
  ) {
    final isHovered = _hoveredIndex == index;
    final isInCart = _isInCart(product['id']);
    final cardWidth = isMobile ? 280.0 : 320.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: cardWidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: isHovered
                ? const Color(0xFFD4AF37)
                : Colors.white.withOpacity(0.2),
            width: isHovered ? 2 : 1,
          ),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Stack(
              children: [
                Container(
                  height: isMobile ? 280 : 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Image.network(
                    product['image'],
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
                ),

                // Zodiac Badge
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    color: Colors.black.withOpacity(0.8),
                    child: Text(
                      product['zodiac'],
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 10,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // Quick View on Hover
                if (isHovered)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.visibility,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          product['name'],
                          style: TextStyle(
                            color: isHovered
                                ? const Color(0xFFD4AF37)
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                        // Description
                        Text(
                          product['description'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // Price and Add to Cart
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${product['price'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFFD4AF37),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Add to Cart Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isInCart
                                ? null
                                : () => _addToCart(product),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isInCart
                                  ? Colors.grey[800]
                                  : (isHovered
                                      ? const Color(0xFFD4AF37)
                                      : Colors.transparent),
                              foregroundColor:
                                  isInCart ? Colors.white54 : Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(
                                  color: isInCart
                                      ? Colors.grey[700]!
                                      : (isHovered
                                          ? const Color(0xFFD4AF37)
                                          : Colors.white),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isInCart
                                      ? Icons.check_circle
                                      : Icons.shopping_bag_outlined,
                                  size: 16,
                                  color: isInCart
                                      ? Colors.white54
                                      : (isHovered
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  isInCart ? 'IN CART' : 'ADD TO CART',
                                  style: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: isInCart
                                        ? Colors.white54
                                        : (isHovered
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        iconSize: 24,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
