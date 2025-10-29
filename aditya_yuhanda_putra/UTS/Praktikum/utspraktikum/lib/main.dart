import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_screen.dart';
import 'berita_screen.dart';
import 'mengikuti_screen.dart';
import 'detail_screen.dart';

void main() => runApp(const MyApp());

// Konfigurasi route GoRouter
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'berita',
          builder: (BuildContext context, GoRouterState state) {
            return const BeritaScreen();
          },
        ),
        GoRoute(
          path: 'mengikuti',
          builder: (BuildContext context, GoRouterState state) {
            return const MengikutiScreen();
          },
        ),
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra as Map<String, dynamic>;
            return DetailScreen(berita: data);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Berita',
      routerConfig: _router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
