import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';

class CustomBanner extends StatelessWidget {
  final VoidCallback onSearch; 
  const CustomBanner({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: bannerColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 32,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sajikan Makanan Enak\nTanpa Keluar Rumah",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  //callback dari parent
                  onPressed: onSearch, 
                  child: const Text(
                    "Cari",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: -170,
            child: SizedBox(
              width: 500,
              height: 500,
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 100,
                child: Image.asset(
                  "assets/images/chef.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}