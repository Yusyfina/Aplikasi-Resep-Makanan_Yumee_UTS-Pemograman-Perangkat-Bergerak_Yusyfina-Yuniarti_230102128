// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resep.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResepAdapter extends TypeAdapter<Resep> {
  @override
  final int typeId = 1;

  @override
  Resep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Resep(
      kalori: fields[0] as int,
      kategori: fields[1] as String,
      gambar: fields[2] as String,
      jumlahBahan: fields[3] as int,
      gambarBahan: (fields[4] as List).cast<String>(),
      namaBahan: (fields[5] as List).cast<String>(),
      nama: fields[6] as String,
      rating: fields[7] as double,
      review: fields[8] as int,
      langkah: (fields[9] as List).cast<String>(),
      waktu: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Resep obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.kalori)
      ..writeByte(1)
      ..write(obj.kategori)
      ..writeByte(2)
      ..write(obj.gambar)
      ..writeByte(3)
      ..write(obj.jumlahBahan)
      ..writeByte(4)
      ..write(obj.gambarBahan)
      ..writeByte(5)
      ..write(obj.namaBahan)
      ..writeByte(6)
      ..write(obj.nama)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.review)
      ..writeByte(9)
      ..write(obj.langkah)
      ..writeByte(10)
      ..write(obj.waktu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
