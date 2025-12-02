import 'package:hive/hive.dart';

part 'resep.g.dart';

@HiveType(typeId: 1)
class Resep extends HiveObject {

  @HiveField(0)
  int kalori;

  @HiveField(1)
  String kategori;

  @HiveField(2)
  String gambar;

  @HiveField(3)
  int jumlahBahan;

  @HiveField(4)
  List<String> gambarBahan;

  @HiveField(5)
  List<String> namaBahan;

  @HiveField(6)
  String nama;

  @HiveField(7)
  double rating;

  @HiveField(8)
  int review;

  @HiveField(9)
  List<String> langkah;

  @HiveField(10)
  int waktu;

  Resep({
    required this.kalori,
    required this.kategori,
    required this.gambar,
    required this.jumlahBahan,
    required this.gambarBahan,
    required this.namaBahan,
    required this.nama,
    required this.rating,
    required this.review,
    required this.langkah,
    required this.waktu,
  });
}