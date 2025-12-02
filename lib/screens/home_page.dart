import 'package:flutter/material.dart';
import 'package:yumee/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/screens/semua_resep.dart';
import 'package:yumee/widgets/banner.dart';
import 'package:yumee/widgets/header_home.dart';
import 'package:yumee/widgets/search_field_home.dart';
import 'package:yumee/widgets/kategori_menu.dart';
import 'package:yumee/widgets/resep_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kategori = "All";

  late Box<Resep> resepBox;
  late Box favBox;

  List<String> kategoriList = [
    "All",
    "Makan Pagi",
    "Makan Siang",
    "Makan Malam",
    "Resep Cepat"
  ];

  List<int> getFavs() => HiveService.getFavs();
  void toggleFav(int keyIndex) async {
    await HiveService.toggleFav(keyIndex);
    setState(() {});
  }

  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    resepBox = HiveService.getResepBox();
    favBox = HiveService.getFavBox();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor.withAlpha(100),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HeaderHome(),

              SearchFieldHome(
                controller: searchController,
                onChanged: (v){
                  setState(() => searchQuery = v.toLowerCase());
                },
              ),

              CustomBanner(
                onSearch: (){
                  final keyword = searchController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SemuaResep(searchQuery: keyword)),
                  );
                },
              ),
              const SizedBox(height: 18),

              KategoriMenu(
                kategoriList: kategoriList,
                current: kategori,
                onTap: (val)=> setState(()=> kategori = val),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Resep Pilihan",
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: ()=> Navigator.push(
                      context, MaterialPageRoute(
                        builder: (_) => SemuaResep(kategoriDipilih: kategori))),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Text("Lihat semua",
                        style: TextStyle(color: primaryColor,fontWeight: FontWeight.w700)
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              ResepListWidget(
                boxResep: resepBox,
                kategori: kategori,
                searchQuery: searchQuery,
                onFavToggle: toggleFav,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
