import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'berita_screen.dart';
import 'mengikuti_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    SplashScreen(),
    BeritaScreen(),
    MengikutiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Untuk Anda"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Berita"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Mengikuti"),
        ],
      ),
    );
  }
}
