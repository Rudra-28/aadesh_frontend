import 'package:aadesh_frontend/view/astrohome.dart';
import 'package:aadesh_frontend/view/crystalstones.dart';
import 'package:aadesh_frontend/view/homecontent/homecontent.dart';
import 'package:aadesh_frontend/view/landingpage.dart';
import 'package:aadesh_frontend/view/shopbyzodiac.dart';
import 'package:aadesh_frontend/view/wearables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AstrologyBraceletApp()));
}

class AstrologyBraceletApp extends StatelessWidget {
  const AstrologyBraceletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Astrology Bracelet',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Serif'),
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    // 1. Move the ShellRoute to the top level
    ShellRoute(
      builder: (context, state, child) {
        // Here, 'child' is whatever sub-route is currently active 
        // (Home, Shop, or Wearables)
        return LandingPage(child: child);
      },
      routes: [
        // 2. This is your "Home" content
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeContent(), 
        ),
        // 3. Sub-pages
        GoRoute(
          path: '/shopbyzodiac',
          builder: (context, state) => const ShopByZodiacPage(),
        ),
        GoRoute(
          path: '/wearables', // Fixed spelling from 'Wearbales'
          builder: (context, state) => const Wearables(),
        ),
         GoRoute(
          path: '/crystalstones', // Fixed spelling from 'Wearbales'
          builder: (context, state) => const CrystalStones(),
        ),
         GoRoute(
          path: '/astrohome', // Fixed spelling from 'Wearbales'
          builder: (context, state) => const AstroHome(),
        ),
      ],
    ),
  ],
);