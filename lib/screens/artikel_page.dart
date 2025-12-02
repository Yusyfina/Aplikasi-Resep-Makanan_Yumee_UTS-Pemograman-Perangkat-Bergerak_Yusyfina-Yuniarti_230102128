import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/services/data_artikel.dart';
import 'package:yumee/models/data_artikel.dart';
import 'package:yumee/screens/artikel_detail.dart';

class ArtikelMakananPage extends StatelessWidget {
  const ArtikelMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: 
        const Text(
          "Rekomendasi Bacaan Masak"
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 28 : 16,
          vertical: 16,
        ),

        child: GridView.builder(
          itemCount: dataArtikel.length,

          gridDelegate: 
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 2 : 1,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,

            childAspectRatio: isTablet ? 0.85 : 0.95,
          ),

          itemBuilder: (context, i) {
            Artikel a = dataArtikel[i];

            return Material(
              elevation: 5,
              shadowColor: Colors.black12,
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),

              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArtikelDetailPage(artikel: a),
                    ),
                  );
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GAMBAR
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        a.gambar,
                        height: isTablet ? 190 : 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Teks
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Judul
                            Text(
                              a.judul,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: isTablet ? 20 : 16,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // Isi
                            Expanded(
                              child: Text(
                                a.isi,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: isTablet ? 16 : 14,
                                  color: Colors.black54,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}