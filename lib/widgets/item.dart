import 'package:flutter/material.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/screens/detail_resep.dart';

class Item extends StatelessWidget {
  final Resep resep;
  final int keyIndex; 
  final void Function(int)? onFavTap; 

  const Item({
    super.key,
    required this.resep,
    required this.keyIndex,
    this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DetailPage menerima objek resep
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              resep: resep,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 160,
                color: Colors.grey.shade200,
                child: resep.gambar.isNotEmpty
                    ? Image.network(
                        resep.gambar,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image, size: 40),
                        ),
                      )
                    : const Icon(Icons.image, size: 40),
              ),
            ),

            const SizedBox(height: 10),

            // Nama
            Text(
              resep.nama,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 4),

            // Informasi
            Row(
              children: [
                const Icon(
                  Icons.local_fire_department, 
                  size: 14
                ),
                const SizedBox(width: 4),
                Text("${resep.kalori} Cal", 
                style: const TextStyle(fontSize: 12)
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.timer, 
                  size: 14
                ),
                const SizedBox(width: 4),
                Text("${resep.waktu} Min", 
                style: const TextStyle(fontSize: 12)
                ),
                const Spacer(),
                // Tombol Favorit
                if (onFavTap != null)
                  GestureDetector(
                    onTap: () => onFavTap!(keyIndex),
                    child: 
                    const Icon(
                      Icons.favorite_border, 
                      color: Colors.red, 
                      size: 18
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}