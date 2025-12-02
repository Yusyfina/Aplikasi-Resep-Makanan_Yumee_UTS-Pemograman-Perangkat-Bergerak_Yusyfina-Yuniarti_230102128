import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/utils/warna.dart';

class DetailPage extends StatefulWidget {
  final Resep resep;

  const DetailPage({super.key, required this.resep});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // ===================== HEADER GAMBAR =====================
                Stack(
                  children: [
                    Image.network(
                      widget.resep.gambar,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 300,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image, size: 40),
                      ),
                    ),

                    // Gradasi hitam atas
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withAlpha(100),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    // Tombol Back
                    Positioned(
                      top: 40,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                    // Tombol Favorite
                    Positioned(
                      top: 40,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                // ===================== KONTEN =====================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul
                      Text(
                        widget.resep.nama,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Info Cepat
                      Row(
                        children: [
                          const Icon(Iconsax.category, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            widget.resep.kategori,
                            style: const TextStyle(color: Colors.white),
                          ),

                          const SizedBox(width: 16),

                          const Icon(Icons.local_fire_department,
                              color: Colors.redAccent),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.resep.kalori}",
                            style: const TextStyle(color: Colors.white),
                          ),

                          const SizedBox(width: 16),

                          const Icon(Iconsax.timer, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.resep.waktu} Menit",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ===================== BAHAN =====================
                      const Text(
                        "Bahan:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 6),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.resep.namaBahan.length,
                        itemBuilder: (_, i) {
                          final nama = widget.resep.namaBahan[i];
                          final gambar = widget.resep.gambarBahan[i];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Image.network(
                                  gambar,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.grey.shade300,
                                    child: const Icon(Icons.image, size: 20),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  nama,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // ===================== LANGKAH =====================
                      const Text(
                        "Langkah:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 6),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.resep.langkah.length,
                        itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            "${i + 1}. ${widget.resep.langkah[i]}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}