import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/screens/navigasi.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  Future<void> finishOnboarding(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool("seenOnboarding", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Main()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildPage(
        img: "assets/images/onboarding1.png",
        title: "Selamat Datang",
        desc: "Aplikasi resep masakan lengkap dan mudah digunakan.",
      ),
      buildPage(
        img: "assets/images/onboarding2.png",
        title: "Jelajahi Resep",
        desc: "Temukan resep, Simpan Koleksi Resep\ndan Masak Kapan pun yang kamu mau.",
      ),
      buildPage(
        img: "assets/images/onboarding3.png",
        title: "Ayo Memasak!",
        desc: "Ikuti langkah demi langkah dan buat masakan terbaikmu.",
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
         //gambar full
          PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => currentPage = i),
            children: pages,
          ),

            SafeArea(
            child: Column(
              children: [
                // Tombol Skip
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () => finishOnboarding(context),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const Spacer(),

                // slide halaman
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentPage == i ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentPage == i ? primaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol mulai
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (currentPage == pages.length - 1) {
                          finishOnboarding(context);
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        currentPage == pages.length - 1 ? 
                        "Mulai" : "Next",
                        style: const TextStyle(
                          fontSize: 18,
                          color : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String img,
    required String title,
    required String desc,
  }) {
    return Stack(
      children: [
        // Gambar full screen
        Positioned.fill(
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(70),
                Colors.black.withAlpha(70),
              ],
            ),
          ),
        ),

        // Teks
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24, 
              vertical: 120
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(231, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}