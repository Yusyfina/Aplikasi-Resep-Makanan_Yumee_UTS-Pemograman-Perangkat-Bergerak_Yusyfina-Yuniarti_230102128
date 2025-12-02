import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/screens/detail_resep.dart';
import 'package:yumee/utils/warna.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/screens/detail_resep_hive.dart';
import 'package:yumee/services/hive_service.dart';

class ResepListWidget extends StatelessWidget {
  final Box<Resep> boxResep;
  final String kategori;
  final String searchQuery;
  final Function(int) onFavToggle;

  const ResepListWidget({
    super.key,
    required this.boxResep,
    required this.kategori,
    required this.searchQuery,
    required this.onFavToggle,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
      valueListenable: boxResep.listenable(),
      builder: (context, box, _) {
        // Dapatkan semua entries (key & value)
        final semuaEntries = box.toMap().entries.toList();

        // Filter entries berdasarkan kategori dan pencarian (case-insensitive)
        final filteredEntries = semuaEntries.where((e) {
          final cocokKategori = kategori == "All" || e.value.kategori == kategori;
          final cocokSearch = e.value.nama.toLowerCase().contains(searchQuery.toLowerCase());
          return cocokKategori && cocokSearch;
        }).toList();

        if (filteredEntries.isEmpty) {
          return Center(
            child: Text(
              "Tidak ada resep yang cocok",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          );
        }

        return SizedBox(
          height: w * 0.61,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: filteredEntries.length,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemBuilder: (context, i) {
              final item = filteredEntries[i].value;
              final index = filteredEntries[i].key as int; // key asli dari Hive
              final isFav = HiveService.isFav(index);

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(resep: item)),
                ),
                child: Container(
                  width: w * 0.53,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        color: Colors.black.withAlpha(100),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Gambar
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),
                            child: item.gambar.startsWith('http')
                                ? Image.network(
                                    item.gambar,
                                    height: w * 0.34,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    item.gambar,
                                    height: w * 0.34,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                          ),

                          // Favorit
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () => onFavToggle(index),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : primaryColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: w * 0.03, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nama,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Iconsax.activity, size: 15, color: primaryColor),
                                const SizedBox(width: 6),
                                Text("${item.kalori} Cal"),
                                const SizedBox(width: 12),
                                const Icon(Iconsax.clock, size: 15, color: primaryColor),
                                const SizedBox(width: 5),
                                Text("${item.waktu} Min"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}