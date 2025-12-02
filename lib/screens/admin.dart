import 'package:flutter/material.dart';
import 'package:yumee/services/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yumee/models/resep.dart';
import 'package:yumee/utils/warna.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Box<Resep> box;

  //controller input
  final nama = TextEditingController();
  final kalori = TextEditingController();
  final waktu = TextEditingController();
  final gambar = TextEditingController();

  final langkahController = TextEditingController();
  final bahanNamaController = TextEditingController();
  final bahanGambarController = TextEditingController();

  String kategoriDipilih = "Makan Pagi";

  final kategoriList = [
    "Makan Pagi",
    "Makan Siang",
    "Makan Malam",
    "Resep Cepat",
  ];

  List<String> listBahanNama = [];
  List<String> listBahanGambar = [];
  List<String> listLangkah = [];

  //untuk update data
  int? editIndex;

  @override
  void initState() {
    super.initState();
    box = HiveService.getResepBox();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        bool mobile = size.maxWidth < 820;

        return Scaffold(
          backgroundColor: const Color(0xFFFDD192).withAlpha(50),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
            title: const Text(
              "Tambah Resep",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          body: mobile ? _mobileView() : _desktopView(),
        );
      },
    );
  }

  Widget _mobileView() => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [formResep(true), 
      const SizedBox(height: 20), 
      listResep(true)],
    ),
  );

  Widget _desktopView() {
    return LayoutBuilder(
      builder: (
        context, 
        constraints
      ) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: formResep(false),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.6,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: listResep(false),
              ),
            ),
          ],
        );
      },
    );
  }

  // Form Input
  Widget formResep(bool mobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            editIndex == null ? "Tambah Resep Baru" : "Edit Resep",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),

          const SizedBox(height: 15),

          inputField("Nama Resep", nama),
          inputField("Kalori", kalori, number: true),
          inputField("Waktu (menit)", waktu, number: true),
          inputField("URL Gambar", gambar),
          kategoriDropdown(),

          const SizedBox(height: 20),

          // Bahan
          const Text(
            "Bahan",
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: inputField(
                  "Nama Bahan", 
                  bahanNamaController
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: inputField(
                  "Gambar Bahan (url)", 
                  bahanGambarController
                ),
              ),
              const SizedBox(width: 10),
              buttonMini("+", addBahan),
            ],
          ),

          listBahanWidget(),
          const SizedBox(height: 20),

          // bagian langkah
          const Text(
            "Langkah Memasak",
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: inputField(
                  "Tambah Langkah Memasak", 
                  langkahController
                ),
              ),
              const SizedBox(width: 10),
              buttonMini("+", addLangkah),
            ],
          ),

          listLangkahWidget(),
          const SizedBox(height: 25),

          // Save
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: saveResep,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                editIndex == null ? "Simpan Resep" : "Simpan Perubahan",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Data
  Widget inputField(
    String label,
    TextEditingController c, {
    bool number = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: c,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          filled: true,
          fillColor: Colors.white,
          border: 
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(13)
          ),
        ),
      ),
    );
  }

  Widget kategoriDropdown() => DropdownButtonFormField(
    value: kategoriDipilih,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: 
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(13)
      ),
    ),
    items: kategoriList
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
        .toList(),
    onChanged: (v) => setState(() => kategoriDipilih = v!),
  );

  Widget buttonMini(
    String text, 
    VoidCallback onTap
    ) 
    => SizedBox(
    width: 55,
    height: 50,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  // buat bahannya
  void addBahan() {
    if (bahanNamaController.text.isEmpty || bahanGambarController.text.isEmpty)
      return;
    setState(() {
      listBahanNama.add(bahanNamaController.text);
      listBahanGambar.add(bahanGambarController.text);
      bahanNamaController.clear();
      bahanGambarController.clear();
    });
  }

  Widget listBahanWidget() => Column(
    children: List.generate(listBahanNama.length, (i) {
      return cardItem([
        Expanded(
          child: Text(
            listBahanNama[i],
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: 
          Text(listBahanGambar[i], 
          style: const TextStyle(fontSize: 12)
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              listBahanNama.removeAt(i);
              listBahanGambar.removeAt(i);
            });
          },
        ),
      ]);
    }),
  );

  // buat langkah
  void addLangkah() {
    if (langkahController.text.isEmpty) return;
    setState(() {
      listLangkah.add(langkahController.text);
      langkahController.clear();
    });
  }

  Widget listLangkahWidget() => Column(
    children: List.generate(listLangkah.length, (i) {
      return cardItem([
        Expanded(
          child: Text(
            listLangkah[i],
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => setState(() => listLangkah.removeAt(i)),
        ),
      ]);
    }),
  );

  // list resep yang udah dibuat
  Widget listResep(bool mobile) {
    return ValueListenableBuilder<Box<Resep>>(
      valueListenable: box.listenable(),
      builder: (context, Box<Resep> data, _) {
        final list = data.values.toList();
        int col = mobile ? 2 : 4;
        if (MediaQuery.of(context).size.width > 1400) col = 5;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: col,
            childAspectRatio: .74,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),

          itemBuilder: (context, i) {
            final r = list[i];
            return InkWell(
              onTap: () => loadForEdit(r, i),
              child: cardItem([
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    r.gambar,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 140,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported, 
                          size: 50
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  r.nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "${r.kalori} Kal • ${r.waktu} menit",
                  style: const TextStyle(fontSize: 12),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: 
                      const Icon(
                        Icons.edit, 
                        color: primaryColor
                        ),
                      onPressed: () => loadForEdit(r, i),
                    ),
                    IconButton(
                      icon: 
                      const Icon(
                        Icons.delete, 
                        color: Colors.red
                        ),
                      onPressed: () => box.deleteAt(i),
                    ),
                  ],
                ),
              ], padding: 12),
            );
          },
        );
      },
    );
  }

  Widget cardItem(List<Widget> children, 
  {double padding = 8}) => Container(
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: primaryColor.withAlpha(100),
          blurRadius: 6,
          offset: const Offset(2, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );

  // nyimpen
  void loadForEdit(Resep r, int index) {
    setState(() {
      editIndex = index;
      nama.text = r.nama;
      kalori.text = r.kalori.toString();
      waktu.text = r.waktu.toString();
      gambar.text = r.gambar;
      kategoriDipilih = r.kategori;

      listBahanNama = List.from(r.namaBahan);
      listBahanGambar = List.from(r.gambarBahan);
      listLangkah = List.from(r.langkah);
    });
  }

  void saveResep() {
    if (nama.text.isEmpty ||
        kalori.text.isEmpty ||
        waktu.text.isEmpty ||
        gambar.text.isEmpty)
      return;

    final data = Resep(
      nama: nama.text,
      kategori: kategoriDipilih,
      gambar: gambar.text,
      kalori: int.parse(kalori.text),
      waktu: int.parse(waktu.text),
      namaBahan: List.from(listBahanNama),
      gambarBahan: List.from(listBahanGambar),
      langkah: List.from(listLangkah),
      jumlahBahan: listBahanNama.length,
      rating: 4.5,
      review: 0,
    );

    editIndex == null ? box.add(data) : box.putAt(editIndex!, data);

    setState(() {
      editIndex = null;
      nama.clear();
      kalori.clear();
      waktu.clear();
      gambar.clear();
      listBahanNama.clear();
      listBahanGambar.clear();
      listLangkah.clear();
    });
  }
}
