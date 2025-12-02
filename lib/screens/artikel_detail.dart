import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/models/data_artikel.dart';

class ArtikelDetailPage extends StatelessWidget {
  final Artikel artikel;
  const ArtikelDetailPage({super.key, required this.artikel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 650;

    return Scaffold(
      backgroundColor: primaryColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // header foto
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(26),
                    ),
                    child: Image.network(
                      artikel.gambar,
                      width: double.infinity,
                      height: isTablet ? 340 : 260,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              // Isi artikel
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 28 : 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      artikel.judul,
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 22,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      artikel.isi,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: isTablet ? 17 : 15,
                        height: 1.55,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}