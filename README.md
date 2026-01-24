## Deskripsi Aplikasi

**Yumee** adalah aplikasi mobile berbasis **Flutter** yang digunakan untuk menampilkan berbagai resep makanan. Aplikasi ini dirancang dengan tampilan yang sederhana dan mudah digunakan, serta mendukung penyimpanan data secara lokal menggunakan **Hive**.

Aplikasi ini dibuat untuk memenuhi tugas **Ujian Tengah Semester (UTS)** mata kuliah **Pemrograman Perangkat Bergerak**.

---

## Fitur Aplikasi

* Kategori resep makanan
* Detail resep (bahan dan langkah memasak)
* Pencarian resep
* Fitur favorit menggunakan Hive
* Artikel seputar makanan
* Penyimpanan data lokal menggunakan Hive

---

## Teknologi yang Digunakan

| Teknologi   | Kegunaan                 | Versi  |
| ----------- | ------------------------ | ------ |
| Flutter SDK | Framework utama          | 3.38.3 |
| Dart        | Bahasa pemrograman       | 3.10.1 |
| Hive        | Penyimpanan data lokal   | 2.2.3  |
| Iconsax     | Icon aplikasi            | 0.0.8  |
| Asset Lokal | Gambar, logo, onboarding | -      |

---

## Struktur Folder

```
assets/
└── images/

lib/
├── main.dart
├── boxes.dart
├── models/
│   ├── resep.dart
│   ├── resep.g.dart
│   └── data_artikel.dart
├── services/
│   ├── hive_service.dart
│   ├── data_resep.dart
│   └── data_artikel.dart
├── screens/
│   ├── splashscreen.dart
│   ├── onboarding.dart
│   ├── home_page.dart
│   ├── detail_page.dart
│   ├── searchPage.dart
│   ├── favoritPage.dart
│   ├── artikel_page.dart
│   ├── artikel_detail.dart
│   ├── semua_resep.dart
│   ├── navigasi.dart
│   ├── rencana_page.dart
│   ├── detail_resep_page.dart
│   ├── detail_resep_hive.dart
│   └── admin.dart
├── widgets/
│   ├── kategori.dart
│   ├── resep_card.dart
│   ├── resep_list.dart
│   ├── search_field_home.dart
│   ├── tombol_icon.dart
│   └── tambahresep.dart
├── theme/
│   └── theme.dart
└── utils/
    └── warna.dart
```

---

## Penjelasan Struktur Folder

### assets

Menyimpan seluruh aset gambar yang digunakan pada aplikasi.

### models

Berisi model data aplikasi seperti resep dan artikel.

### screens

Berisi seluruh halaman utama aplikasi.

### widgets

Berisi custom widget yang digunakan kembali di berbagai halaman.

### services

Mengatur penyimpanan dan pengelolaan data menggunakan Hive.

### theme

Mengatur tema aplikasi (light dan dark mode).

### utils

Menyimpan utilitas seperti warna aplikasi.

### boxes.dart

Pengaturan Hive Box.

### main.dart

Entry point aplikasi dan proses inisialisasi awal.

### pubspec.yaml

Konfigurasi dependencies dan asset aplikasi.

---

## Layout yang Digunakan

### Single Child Layout

Digunakan pada:

* Splashscreen
* Header Home
* Banner rekomendasi

Widget:

* Container
* Padding
* Center
* Align

### Multi Child Layout

Digunakan pada:

* Kategori resep (Row)
* List rekomendasi (Column)

Widget:

* Row
* Column
* Expanded
* Spacer

### Layout Bersusun

Digunakan pada:

* Detail Page
* Card kategori dengan overlay gambar

Widget:

* Stack
* Positioned

### Scrollable Layout

Digunakan pada:

* ListView
* GridView
* SingleChildScrollView

### Layout Responsif

* MediaQuery
* LayoutBuilder

---

## Halaman Aplikasi

### home_page.dart

Menampilkan header, kategori resep, rekomendasi, dan navigasi.

### detail_page.dart

Menampilkan detail bahan dan langkah memasak.

### favorit_page.dart

Menampilkan resep favorit menggunakan Hive.

### admin.dart

Halaman CRUD resep yang terhubung dengan Hive.

### artikel_page.dart

Menampilkan daftar artikel dalam bentuk grid.

### artikel_detail.dart

Menampilkan detail artikel.

### navigasi.dart

Root halaman dengan empat tab navigasi.

### onboarding.dart

Tampilan awal aplikasi yang muncul satu kali.

### rencana_page.dart

Halaman daftar rencana masakan.

### semua_resep.dart

Menampilkan seluruh resep berdasarkan kategori.

### splashscreen.dart

Tampilan awal sebelum onboarding.

---

## Widget

### kategori.dart

Menampilkan kategori resep.

### resep_card.dart

Menampilkan informasi resep seperti nama, waktu masak, dan rating.

### resep_list.dart

Menampilkan daftar resep berdasarkan kategori.

### search_field_home.dart

Input pencarian pada halaman Home.

### tambahresep.dart

Halaman CRUD resep.

### tombol_icon.dart

Widget tombol icon custom.

---

## Models

### resep.dart

Model data resep makanan.

### resep.g.dart

File hasil generate Hive.

### data_artikel.dart

Model data artikel.

---

## Services

### data_resep.dart

Mengisi data awal resep ke Hive.

### data_artikel.dart

Data artikel aplikasi.

### hive_service.dart

Helper pengelolaan penyimpanan lokal Hive.

---

## Theme dan Utils

### theme.dart

Mengatur tema terang dan gelap aplikasi.

### warna.dart

Palet warna aplikasi.

**Color Palette**

* Primary : `#FFB441`
* Background : `#FFF0DB`

---

## Kontak

* **GitHub** : [https://github.com/Yusyfina](https://github.com/Yusyfina)
* **Email** : [yusyfina@gmail.com]
