import 'package:flutter/material.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/utils/warna.dart';
import 'package:iconsax/iconsax.dart';

class ResepCard extends StatelessWidget {
  final Resep resep;
  final int keyIndex;
  final bool isFavorit;
  final void Function(int)? onFavTap;
  final void Function(Resep)? onCardTap;

  const ResepCard({
    super.key,
    required this.resep,
    required this.keyIndex,
    this.isFavorit = false,
    this.onFavTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width * 0.53;

    return GestureDetector(
      onTap: () {
        if (onCardTap != null) onCardTap!(resep);
      },
      child: Container(
        width: w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 1,
              color: Colors.black.withAlpha(100),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: AspectRatio(
                    aspectRatio: 5 / 3, 
                    child: Image.network(
                      resep.gambar,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (onFavTap != null) onFavTap!(keyIndex);
                    },
                    child: Icon(
                      isFavorit ? Icons.favorite : Icons.favorite_border,
                      color: isFavorit ? Colors.red : primaryColor,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),

            // 🎯 AREA TEKS
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Nama Resep
                  Text(
                    resep.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Kalori & Waktu
                  Row(
                    children: [
                      Icon(Iconsax.activity, size: 15, color: primaryColor),
                      const SizedBox(width: 6),
                      Text("${resep.kalori} Cal"),

                      const SizedBox(width: 12),

                      Icon(Iconsax.clock, size: 15, color: primaryColor),
                      const SizedBox(width: 5),
                      Text("${resep.waktu} Min"),
                    ],
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