import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data/news_data.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Berita")),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final berita = newsList[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Image.asset(berita["gambar"], width: 100, fit: BoxFit.cover),
            title: Text(berita["judul"], style: const TextStyle(color: Colors.white)),
            subtitle: Text(berita["tanggal"], style: const TextStyle(color: Colors.white70)),
            onTap: () {
              context.go('/detail', extra: berita);
            },
          );
        },
      ),
    );
  }
}
