import 'package:hive/hive.dart';
import 'models/resep.dart';

class Boxes {
  static Box<Resep> getResepBox() => Hive.box<Resep>('resepBox');
}
