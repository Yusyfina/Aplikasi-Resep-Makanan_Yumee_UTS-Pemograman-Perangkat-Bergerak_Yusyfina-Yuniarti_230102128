import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/widgets/resep_card.dart';
import 'package:yumee/screens/detail_resep.dart';

class SemuaResep extends StatelessWidget {
  final String kategoriDipilih; 
  final String? searchQuery; 

  const SemuaResep(
    {super.key, 
    this.kategoriDipilih = "All", 
    this.searchQuery}
  );

  @override
  Widget build(BuildContext context) {
    final resepBox = Hive.box<Resep>('resepBox');
    final favBox = Hive.box('favBox');

    List<int> getFavs() {
      return List<int>.from(
        favBox.get(
          'favs', 
          defaultValue: <int>[])
      );
    }

    void toggleFav(int key) {
      final favs = getFavs();
      if (favs.contains(key)) {
        favs.remove(key);
      } else {
        favs.add(key);
      }
      favBox.put(
        'favs', 
        favs
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Semua Resep - $kategoriDipilih"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: resepBox.listenable(),
        builder: (context, box, _) {
          final entries = box.keys.cast<int>().map((k) {
            final data = box.get(k);
            return data == null ? null : MapEntry(k, data);
          }
      )
          .whereType<MapEntry<int, 
          Resep>>().toList();

          // Filter kategori
          var filtered = kategoriDipilih == "All"
              ? entries
              : entries.where((e) => e.value.kategori == kategoriDipilih).toList();

          // Filter cari
          if (searchQuery != null && searchQuery!.isNotEmpty) {
            final keyword = searchQuery!.toLowerCase();
            filtered = filtered
                .where((e) => e.value.nama.toLowerCase().contains(keyword))
                .toList();
          }

          if (filtered.isEmpty) {
            return const Center(
              child: Text(
                "Tidak ada resep dalam kategori ini",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          // grid
          int count = 2;
          final w = MediaQuery.of(context).size.width;
          if (w > 1200) count = 4;
          else if (w > 800) count = 3;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: filtered.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (_, i) {
                final key = filtered[i].key;
                final resep = filtered[i].value;
                final isFav = getFavs().contains(key);

                return ResepCard(
                  resep: resep,
                  keyIndex: key,
                  isFavorit: isFav,
                  onFavTap: (k) => toggleFav(k),
                  onCardTap: (_) {
                    // Kirim objek Resep langsung ke DetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          resep: resep, 
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}