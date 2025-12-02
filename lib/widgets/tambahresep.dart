import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/utils/warna.dart';

class AdminFormWidget extends StatelessWidget {
  final TextEditingController nama, kalori, waktu, gambar;
  final TextEditingController bahanNamaController, bahanGambarController, langkahController;
  final List<String> kategoriList, listBahanNama, listBahanGambar, listLangkah;
  final String kategoriDipilih;
  final Function(String) onKategoriChange;
  final VoidCallback addBahan, addLangkah, save;
  final int? editIndex;

  const AdminFormWidget({
    super.key,
    required this.nama,
    required this.kalori,
    required this.waktu,
    required this.gambar,
    required this.bahanNamaController,
    required this.bahanGambarController,
    required this.langkahController,
    required this.kategoriDipilih,
    required this.kategoriList,
    required this.listBahanNama,
    required this.listBahanGambar,
    required this.listLangkah,
    required this.onKategoriChange,
    required this.addBahan,
    required this.addLangkah,
    required this.save,
    this.editIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(editIndex == null ? "Tambah Resep Baru" : "Edit Resep",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor)),

          _input("Nama Resep", nama),
          _input("Kalori", kalori, number: true),
          _input("Waktu", waktu, number: true),
          _input("URL Gambar", gambar),

          DropdownButtonFormField(
            value: kategoriDipilih,
            decoration: _fieldDecoration(),
            items: kategoriList.map((e) => DropdownMenuItem(
              value: e, child: Text(e)
              )
            )
            .toList(),
            onChanged: (v) => onKategoriChange(v!),
          ),

          const SizedBox(height: 20),
          const Text(
            "Bahan", 
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: primaryColor
            )
          ),

          Row(children: [
            Expanded(child: _input(
              "Bahan", 
              bahanNamaController
            )
          ),
            const SizedBox(width: 10),
            Expanded(
              child: _input(
                "Gambar URL", 
                bahanGambarController
              )
            ),
            IconButton(
              onPressed: addBahan, 
              icon: const Icon(
                Icons.add_circle, 
                color: primaryColor
              )
            )
          ]),

          ...listBahanNama.map((e) => Text("• $e")),

          const SizedBox(height: 15),
          const Text(
            "Langkah Memasak", 
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: primaryColor
            )
          ),
          Row(children: [
            Expanded(
              child: _input(
                "Langkah", 
                langkahController
                )
              ),
            IconButton(
              onPressed: addLangkah, 
              icon: const Icon(
                Icons.add_circle, 
                color: primaryColor
              )
            )
          ]),
          ...listLangkah.map((e) => Text("- $e")),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: save,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor
              ),
              child: Text(editIndex == null ? 
              "Simpan" : "Simpan Perubahan",
                  style: const TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold)
                  ),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration _fieldDecoration() => InputDecoration(
    filled: true, fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
  );

  Widget _input(
    String label, 
    TextEditingController c, 
    {bool number = false}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextField(
          controller: c,
          keyboardType: number ? TextInputType.number : TextInputType.text,
          decoration: _fieldDecoration().copyWith(labelText: label),
        ),
      );
}

class AdminResepGrid extends StatelessWidget {
  final Box<Resep> box;
  final Function(Resep, int) onEdit;
  final Function(int) onDelete;

  const AdminResepGrid({
    super.key,
    required this.box,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (_, box, __) {
        final list = box.values.toList();
        return GridView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: .74, 
            crossAxisSpacing: 12, 
            mainAxisSpacing: 12
          ),
          itemBuilder: (_, i) {
            final r = list[i];
            return InkWell(
              onTap: () => onEdit(r, i),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: primaryColor.withAlpha(100), 
                    blurRadius: 6, offset: Offset(2, 3)
                    )
                    ]
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.network(
                        r.gambar, 
                        height: 130, 
                        width: double.infinity, 
                        fit: BoxFit.cover
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      r.nama, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: primaryColor)
                      ),
                    Text("${r.kalori} Kal • ${r.waktu} menit", 
                    style: const TextStyle(fontSize: 12)),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () => onEdit(r, i), 
                        icon: const Icon(
                          Icons.edit, 
                          color: primaryColor
                        )
                        ),
                        IconButton(onPressed: () => onDelete(i), 
                        icon: 
                        const Icon(
                          Icons.delete, 
                          color: Colors.red
                        )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}