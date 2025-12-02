import 'package:hive_flutter/hive_flutter.dart';
import '../models/resep.dart';

class HiveService {
  // Nama box
  static const String resepBoxName = 'resepBox';
  static const String favBoxName = 'favBox';

  // Init Hive
  // Dipanggil sekali di main.dart
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ResepAdapter());
    await Hive.openBox<Resep>(resepBoxName);
    await Hive.openBox(favBoxName);
  }

  // Box
  static Box<Resep> getResepBox() => Hive.box<Resep>(resepBoxName);
  static Box getFavBox() => Hive.box(favBoxName);

  // Resep
  //Tambah resep baru
  static Future<void> addResep(Resep resep) async {
    final box = getResepBox();
    await box.add(resep);
  }

  //Hapus resep berdasarkan index
  static Future<void> deleteResep(int index) async {
    final box = getResepBox();
    await box.deleteAt(index);
  }

  // Update resep berdasarkan index
  static Future<void> updateResep(int index, Resep resep) async {
    final box = getResepBox();
    await box.putAt(index, resep);
  }

  //Ambil semua resep sebagai list
  static List<Resep> getAllResep() {
    final box = getResepBox();
    return box.values.toList();
  }

  // Favorit
  // Tambah atau hapus
  static Future<void> toggleFav(int keyIndex) async {
    final favBox = getFavBox();
    List<int> fav = List<int>.from(favBox.get(
      "favs", 
      defaultValue: <int>[])
    );

    if (fav.contains(keyIndex)) {
      fav.remove(keyIndex);
    } else {
      fav.add(keyIndex);
    }

    await favBox.put("favs", fav);
  }

  // Ambil list favorit
  static List<int> getFavs() {
    final favBox = getFavBox();
    return List<int>.from(favBox.get(
      "favs", 
      defaultValue: <int>[])
    );
  }

  // Mengeck index tertentu favorit
  static bool isFav(int keyIndex) {
    return getFavs().contains(keyIndex);
  }

  // Hapus semua favorit
  static Future<void> clearFavs() async {
    final favBox = getFavBox();
    await favBox.put("favs", <int>[]);
  }
}