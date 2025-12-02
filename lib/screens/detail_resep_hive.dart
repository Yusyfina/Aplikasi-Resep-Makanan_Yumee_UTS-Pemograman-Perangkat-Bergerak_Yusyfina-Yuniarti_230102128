import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/services/hive_service.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/models/resep.dart';

class DetailResep extends StatefulWidget {
  final int resepKey;

  const DetailResep({super.key, required this.resepKey});

  @override
  State<DetailResep> createState() => _DetailResepState();
}

class _DetailResepState extends State<DetailResep> {
  Resep? resep;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    resep = HiveService.getResepBox().get(widget.resepKey);
    isFav = HiveService.isFav(widget.resepKey);
  }

  void toggleFav() async {
    await HiveService.toggleFav(widget.resepKey);
    setState(() {
      isFav = HiveService.isFav(widget.resepKey);
    });
  }

  // Widget bahan (gambar + nama)
  Widget buildBahanItem(int index) {
    final img = resep!.gambarBahan[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          img.startsWith('http')
              ? Image.network(
                img, width: 50, 
                height: 50, 
                fit: BoxFit.cover
              )
              : Image.asset(
                img, 
                width: 50, 
                height: 50, 
                fit: BoxFit.cover
              ),
          const SizedBox(width: 12),
          Expanded(
              child: Text(
            resep!.namaBahan[index],
            style: const TextStyle(fontSize: 16),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (resep == null) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Detail"),
        ),
        body: const Center(child: Text("Resep tidak ditemukan")),
      );
    }

    final width = MediaQuery.of(context).size.width;
    final imageHeight = width * 0.55;
    final padding = width * 0.045;
    final bigText = width * 0.052;
    final normalText = width * 0.038;
    final smallText = width * 0.034;
    final iconSize = width * 0.045;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar header
                  SizedBox(
                    width: double.infinity,
                    height: imageHeight,
                    child: resep!.gambar.startsWith('http')
                        ? Image.network(
                          resep!.
                          gambar, 
                          fit: BoxFit.cover
                        )
                        : Image.asset(
                          resep!.gambar, 
                          fit: BoxFit.cover
                        ),
                  ),

                  // Isi
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(padding),
                    transform: Matrix4.translationValues(0, -18, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Resep
                        Text(
                          resep!.nama,
                          style: TextStyle(fontSize: bigText, 
                          fontWeight: FontWeight.w600
                        ),
                        ),
                        const SizedBox(height: 12),

                        //Informasi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Iconsax.activity, 
                                  size: iconSize
                                ),
                                const SizedBox(width: 4),
                                Text("${resep!.kalori} Cal", 
                                style: TextStyle(fontSize: smallText)
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Iconsax.clock, 
                                  size: iconSize
                                ),
                                const SizedBox(width: 4),
                                Text("${resep!.waktu} Min", 
                                style: TextStyle(fontSize: smallText)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.star, 
                                  size: iconSize, 
                                  color: Colors.amber
                                  ),
                                const SizedBox(width: 4),
                                Text("${resep!.rating}/5", 
                                style: TextStyle(fontSize: smallText)),
                                const SizedBox(width: 8),
                                Text("${resep!.review} Viewers", 
                                style: TextStyle(fontSize: smallText)),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        //Bahan
                        Text("Bahan - Bahan",
                            style: TextStyle(fontSize: normalText, 
                            fontWeight: FontWeight.w600)
                        ),
                        const SizedBox(height: 12),

                        Column(
                          children: 
                          List.generate(
                            resep!.namaBahan.length, 
                            (i) => buildBahanItem(i)
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Langkah Masak
                        Text("Langkah Memasak",
                            style: TextStyle(
                              fontSize: normalText, 
                              fontWeight: FontWeight.w600)
                        ),
                        const SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            resep!.langkah.length,
                            (i) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                "• ${resep!.langkah[i]}",
                                style: TextStyle(
                                  fontSize: smallText, 
                                  height: 1.5
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Kembali
            Positioned(
              top: 12,
              left: 12,
              child: _circleButton(
                icon: Iconsax.arrow_left_2, 
                size: iconSize + 4, 
                onTap: () => Navigator.pop(context)
              ),
            ),

            // Tombol Favorit
            Positioned(
              top: 12,
              right: 12,
              child: _circleButton(
                icon: isFav ? Iconsax.heart5 : Iconsax.heart,
                color: isFav ? primaryColor : Colors.grey.shade700,
                size: iconSize + 4,
                onTap: toggleFav,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required double size,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(200), 
        shape: BoxShape.circle),
      child: 
      IconButton(
        icon: Icon(
          icon, 
          color: color ?? Colors.black, 
          size: size
        ), 
        onPressed: onTap
      ),
    );
  }
}