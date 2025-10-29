import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data/news_data.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> berita;
  const DetailScreen({super.key, required this.berita});

  Color _getCategoryColor(String? kategori) {
    if (kategori == null || kategori.isEmpty) return Colors.grey;

    switch (kategori.toLowerCase()) {
      case 'wirausaha':
        return Colors.orange;
      case 'teknologi':
        return Colors.blue;
      case 'sains':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final otherNews = newsList.where((n) => n != berita).toList();

    return Scaffold(
      appBar: AppBar(title: Text(berita["judul"] ?? "Detail Berita")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/${berita["gambar"]}",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 64,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    berita["jurnalis"] ?? "Redaksi",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    berita["judul"] ?? "Judul Berita",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    berita["tanggal"] ?? "Tanggal tidak tersedia",
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    berita["isi"] ?? "Konten berita tidak tersedia.",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Berita Lainnya",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: otherNews.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      final item = otherNews[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to detail of the selected news item
                          context.go('/detail', extra: item);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: item["gambar"] != null
                                      ? Image.asset(
                                          "assets/${item["gambar"]}",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey[800],
                                                  child: const Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.grey,
                                                    size: 40,
                                                  ),
                                                );
                                              },
                                        )
                                      : Container(
                                          color: Colors.grey[800],
                                          child: const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.grey,
                                            size: 40,
                                          ),
                                        ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["judul"] ?? "Judul tidak tersedia",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      if (item["kategori"] != null &&
                                          item["kategori"]
                                              .toString()
                                              .isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getCategoryColor(
                                              item["kategori"].toString(),
                                            ).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: _getCategoryColor(
                                                item["kategori"].toString(),
                                              ),
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            item["kategori"].toString(),
                                            style: TextStyle(
                                              color: _getCategoryColor(
                                                item["kategori"].toString(),
                                              ),
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
