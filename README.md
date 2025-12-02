# Aplikasi-Resep-Makanan_Yumee_UTS-Pemograman-Perangkat-Bergerak_Yusyfina-Yuniarti_230102128
# LAPORAN 
# Aplikasi Yumee (Resep Makanan) 
Nama: Yusyfina Yuniarti 
NIM: 230102128 
Kelas: IF23B 
Mata Kuliah: Pemrograman Perangkat Bergerak 

Dosen Pengampu: 
Fajar Winata S.Kom., M.T. 
Rizky Kharisma N. E. P. S.Tr.Kom., M.T. 

GitHub: https://github.com/Yusyfina
Email : yusyfina@gmail.com 

# DESKRIPSI 
  Yumee adalah aplikasi berbasis Flutter untuk menampilkan berbagai resep makanan yang dilengkapi dengan beberapa fitur seperti: 
  •	Kategori resep 
  •	Detail resep 
  •	Pencarian resep 
  •	Fitur favorit menggunakan Provider 
  •	Penyimpanan lokal menggunakan Hive 
  Aplikasi ini dibuat untuk memenuhi tugas Ujian Tengah Semester mata kuliah Pemrograman Perangkat Bergerak. 
# TEKNOLOGI YANG DIGUNAKAN 
  | Teknologi   | Kegunaan              | Versi   |
  |------------ |--------------------- -|---------|
  | Flutter SDK | Framework Utama       | 3.38.3  |
  | Dart        | Bahasa Pemrograman    | 3.10.1  |
  | Asset lokal | Gambar Resep dan Bahan| -       |
  | Hive        | Menyimpan data lokal  | 2.2.3   |

# STRUKTUR FOLDER 
assets/
├── imagesa
lib/ 
├── main.dart 
├── boxes.dart 
│ 
├── models/ 
│ ├── resep.dart 
│ ├── resep.g.dart 
│ └── data_artikel.dart 
│ 
├── services/ 
│ ├── hive_service.dart 
│ ├── data_resep.dart 
│ └── data_artikel.dart 
│ 
├── screens/ 
│ ├── splashscreen.dart 
│ ├── onboarding.dart 
│ ├── home_page.dart 
│ ├── detail_page.dart 
│ ├── searchPage.dart 
│ ├── favoritPage.dart 
│ ├── artikel_page.dart 
│ ├── artikel_detail.dart 
│ ├── semua_resep.dart 
│ ├── navigasi.dart 
│ ├── rencana_page.dart 
│ ├── detail_resep_page.dart 
│ ├── detail_resep_hive.dart 
│ └── admin.dart (opsional) 
│ 
├── widgets/ 
│ ├── kategori.dart 
│ ├── resep_card.dart 
│ ├── resep_list.dart 
│ ├── search_field_home.dart 
│ ├── tombol_icon.dart 
│ └── tambahresep.dart 
│ 
├── theme/ 
│ └── theme.dart 
│ 
└── utils/ 
└── warna.dart 
Penjelasan Struktur: 
1.	assets/ : image/ = gambar yang dibutuhkan untuk aplikasi 
2.	models/ : berisi class resep 
3.	screens/ : halaman aplikasi 
4.	widgets/ : custom widget yang diambil di halaman 
5.	services/ : Penyimpanan data hive maupun hive yang menjalankan datanya 
6.	theme/ : Mode tampilannya menyesuaikan device 
7.	utils/ : Menyimpan warna yang dipakai di aplikasi 
8.	boxes.dart: pengaturan Hivenya 
9.	main.dart : entry point utama dan ada proses inisialisasi awal, setup database lokal (Hive), penambahan data resep default, serta pengaturan tema aplikasi.
10.	pubspec.yaml : asset & dependencies aplikasi 

# LAYOUT FLUTTER 
1. Single Child Layout 
   Digunakan untuk: 
   •	Splashscreen 
   •	Header Home 
   •	Banner rekomendasi 
  Widget yang digunakan: 
  •	Container 
  •	Padding 
  •	Center 
  •	Align 
2. Multi-Child Layout 
   Digunakan untuk: 
   •	Kategori (Row) 
   •	List rekomendasi (Column) 
  Widget: 
  •	Row 
  •	Column 
  •	Expanded 
  •	Spacer 
3. Layout Bersusun 
   Dipakai untuk : 
   •	DetailPage 
   •	Card kategori yang memiliki overlay gambar 
   Widget :
   •	Stack 
  •	Positioned
4. Scrollable Layout 
   •	List Resep (List View)
   •	Layout grid (GridView)
   •	Detail resep (SingleChildScrollView)
5. Layout Responsif 
   •	MediaQuery 
   •	LayoutBuilder 

# HALAMAN 
1. home_page.dart 
   •	Header aplikasi 
   •	Kategori resep 
   •	Rekomendasi resep 
   •	Navigasi ke detail resep 
   •	Tombol menuju Search dan Favorit 
3. detail_page.dart 
   Menampilkan detail resep dari mulai bahan sampai langkahnya. 
4. favorit.dart 
   •	Menampilkan resep yang difavoritkan pengguna 
   •	Menggunakan Provider dan Hive 
5. admin.dart 
   •	Halaman untuk menambahkan, mengedit, dan menghapus resep dalam apliaksi yang terhubung dengan Hive Database sehingga resep tersimpan. 
   •	Pengguna bisa menambahkan data resep seperti nama resep, bahan, langkah, kalori, waktu masak dan kategori. 
6. artikel_detail.dart 
   •	Menampilkan detail isi artikel yaitu gambar, judul dan isi informasinya. 
   •	Memungkinkan overlay tombol back di atas gambar. 
7. artikel_page.dart 
   •	Menampikan data artikel dalam bentuk grid dan bisa di klik untuk melihat detailnya yang terhubung dengan artikel detail. 
   •	AppBar menggunakan warna tema 
8. detail_resep_page.dart 
   Menampilkan detail resep seperti bahan dan langkah. 
9. detail_resep_hive.dart 
   Mengambil data resep dari hive 
10.navigasi.dart 
   Halaman root yang mengatur Tampilan 4 Tab yaitu home, favorit, rencana, artikel 
11.onboarding.dart 
   •	Tampilan awal aplikasi Yumee sebelum pengguna masuk ke halaman utama yang disimpan menggunakan SharedPreferences jadi muncul sekali. 
   •	Menampilkan page view 3 halaman yaitu gambar full screen dan menampilkan judul dan deskripsi 
12. rencana_page.dart 
    Halaman untuk membuatdaftar masakan, pengguna bisa menambah, melihat dan menghapus daftar rencana. 
13.semua_resep.dart 
   •	Menampilkan seluruh daftar resep berdasar pencarian kategori 
   •	Bisa menambahkan favorit yang tersimpan di halaman favorit karena disimpan di favBox Hive. 
14.splashscreen.dart 
   Halaman awal sebelum diarahkan ke onboarding. 

# CUSTOM WIDGETS 
1. kategori.dart 
   Menampilkan kategori resep yaitu all,Makan Pagi, Makan Siang, Makan Malam 
2. resep_card.dart 
   •	Menampilkan detail resep seperti nama,rating,waktu memasak 
   •	Digunakan di banyak halaman 
3.resep_list.dart 
  •	Menampilkan daftar resep 
  •	Data diambil dari Hive lalu difilter di kategori pencarian 
4.search_field_home.dart 
  Input pencarian pada halaman Home 
5.tambahresep.dart 
  Untuk halaman admin yang menambah, mengedit dan menghapus resep. 
6.tombol_icon 
  Membuat tombol icon 
# Models 
1. data_artikel.dart 
   Menyimpan dan mengelola informasi resep. 
2. resep.dart 
   Menyimpan data resep makanan secara offline menggunakan hive. 
3. resep.g.dart 
   Generated code oleh Hive untuk mengubah data dan melakukan aktivitas yang dilakukan Hive dari data. 
# Services 
1. data_artikel.dart 
   Data awal resep masakan 
2.data_resep.dart 
  Mengisi data awal ke dalam Hive. 
3.hive_service.dart 
  Helper untuk mengelola penyimpanan lokal menggunakan Hive yang menangani penyimpanan data resep dan daftar favorit. 
# theme 
1.theme.dart 
  Mengatur tema terang dan gelap. 
# utils 
1.warna.dart 
  Pallet aplikasi untuk semua halaman. 
  Color Palette 
    Primary: #FFB441 
    Secondary: #E29326 
    Background: #FFF0DB 


