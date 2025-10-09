import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mataKuliah = [
      'Penjaminan Mutu Perangkat Lunak',
      'Pemrograman Mobile',
      'Metodologi Penelitian',
      'Manajemen Proyek Sistem Informasi',
      'Enterprise Resource Planning',
      'Manajemen Rantai Pasok',
      'Kecerdasan Bisnis',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profil.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Aditya Yuhanda Putra',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Politeknik Negeri Malang'),
                    Text('Teknologi Informasi'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Mata Kuliah Semester 5:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Text(
                      mataKuliah[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery');
              },
              icon: const Icon(Icons.photo),
              label: const Text('Lihat Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}
