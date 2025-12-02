import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/screens/favorit.dart';
import 'package:yumee/screens/home_page.dart';
import 'package:yumee/screens/rencana_page.dart';
import 'package:yumee/screens/artikel_page.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedIndex = 0;
  late final List<Widget> pages;
  @override
  void initState() {
    pages = [
      const HomePage(),
      const FavoritePage(),
      const RencanaPage(),
      const ArtikelMakananPage(),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 28,
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle:TextStyle(
          fontSize: 14,
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ), 
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
            selectedIndex == 0 ?
            Iconsax.home5 : Iconsax.home1,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1 ?
              Iconsax.heart5 : Iconsax.heart,
            ),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2 ?
              Iconsax.calendar5 : Iconsax.calendar,
            ),
            label: 'Rencana',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 3 ?
              Iconsax.book : Iconsax.book,
            ),
            label: 'Artikel',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
  
  navBarPage(iconNama){
    return Center(
      child: Icon(iconNama, size: 100, color: primaryColor,),
    );
  }
}
