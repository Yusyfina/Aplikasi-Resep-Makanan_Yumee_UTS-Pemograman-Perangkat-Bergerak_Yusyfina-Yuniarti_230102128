import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';
import 'package:iconsax/iconsax.dart';

class RencanaPage extends StatefulWidget {
  const RencanaPage({super.key});

  @override
  State<RencanaPage> createState() => _RencanaPageState();
}

class _RencanaPageState extends State<RencanaPage> {
  List<Map<String, String>> rencanaMasakan = [
    {
      "nama": "Nasi Goreng Spesial", 
      "waktu": "30 Menit"
    },
    {
      "nama": "Sup Ayam Kampung", 
      "waktu": "45 Menit"
    },
  ];

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();

  void _tambahRencana() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Rencana Masakan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama Masakan"),
              ),
              TextField(
                controller: _waktuController,
                decoration: const InputDecoration(labelText: "Waktu (Menit)"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _namaController.clear();
                _waktuController.clear();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {
                final nama = _namaController.text.trim();
                final waktu = _waktuController.text.trim();
                if (nama.isNotEmpty && waktu.isNotEmpty) {
                  setState(() {
                    rencanaMasakan.add({
                      "nama": nama, 
                      "waktu": "$waktu Menit"
                    });
                  });
                  Navigator.pop(context);
                  _namaController.clear();
                  _waktuController.clear();
                }
              },
              child: const Text("Tambah"),
            ),
          ],
        );
      },
    );
  }

  void _hapusRencana(int index) {
    setState(() {
      rencanaMasakan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: backgroundColor.withAlpha(230),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Rencana Masakan"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rencana Masakan Hari Ini",
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: rencanaMasakan.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.calendar_tick, 
                            size: width * 0.15, 
                            color: primaryColor
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            "Belum ada rencana masakan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: rencanaMasakan.length,
                      itemBuilder: (context, index) {
                        final item = rencanaMasakan[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withAlpha(50),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: primaryColor.withAlpha(50),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: 
                                const Icon(
                                  Iconsax.cake, 
                                  color: primaryColor
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["nama"]!,
                                      style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item["waktu"]!,
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: primaryColor.withAlpha(150),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Iconsax.close_circle, 
                                  color: Colors.redAccent
                                ),
                                onPressed: () => _hapusRencana(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: _tambahRencana,
        child: const Icon(Iconsax.add),
      ),
    );
  }
}