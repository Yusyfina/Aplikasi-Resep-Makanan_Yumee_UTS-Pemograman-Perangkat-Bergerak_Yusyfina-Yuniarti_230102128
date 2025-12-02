import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/services/hive_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/screens/detail_resep_hive.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Box<Resep> resepBox;
  late Box favBox;

  @override
  void initState() {
    super.initState();
    resepBox = HiveService.getResepBox();
    favBox = HiveService.getFavBox();
  }

  List<int> getFavKeys() => HiveService.getFavs();

  void toggleFav(int key) async {
    await HiveService.toggleFav(key);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Favorit"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: favBox.listenable(),
        builder: (context, box, _) {
          final favKeys = getFavKeys();

          if (favKeys.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada favorit\nTambahkan resep kesukaanmu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 16
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: favKeys.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final key = favKeys[index];
              final resep = resepBox.get(key);

              if (resep == null) {
                toggleFav(key);
                return const SizedBox.shrink();
              }

              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResep(resepKey: key),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withAlpha(50),
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          resep.gambar,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              resep.nama,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.activity, 
                                  size: 16, 
                                  color: primaryColor
                                ),
                                const SizedBox(width: 4),
                                Text("${resep.kalori} Cal", 
                                style: const TextStyle(fontSize: 12)
                                ),
                                const SizedBox(width: 12),
                                const Icon(Iconsax.clock, 
                                size: 16, 
                                color: primaryColor
                                ),
                                const SizedBox(width: 4),
                                Text("${resep.waktu} Min", 
                                style: const TextStyle(fontSize: 12)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete, 
                          color: Colors.red
                        ),
                        onPressed: () => toggleFav(key),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}