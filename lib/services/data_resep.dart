import '../services/hive_service.dart';
import '../models/resep.dart';

class DataInitializer {
  static Future<void> addInitialData() async {
    final resepBox = HiveService.getResepBox();

    if (resepBox.isEmpty) {
      // Opor Ayam
      await HiveService.addResep(
        Resep(
          kalori: 320,
          kategori: "Makan Siang",
          gambar: "assets/images/oporayam.png",
          jumlahBahan: 8,
          gambarBahan: [
            "assets/images/ayam.png",
            "assets/images/santan.png",
            "assets/images/bawang.png",
            "assets/images/jahe.png",
            "assets/images/jahe.png",
            "assets/images/daunsalam.png",
            "assets/images/garam.png",
            "assets/images/minyak.png",
          ],
          namaBahan: [
            "Ayam",
            "Santan",
            "Bawang Putih",
            "Jahe",
            "Lengkuas",
            "Daun Salam",
            "Garam",
            "Minyak",
          ],
          nama: "Opor Ayam",
          rating: 4.7,
          review: 150,
          langkah: [
            "Tumis bumbu halus hingga harum",
            "Masukkan ayam dan aduk rata",
            "Tambahkan santan dan bumbu",
            "Masak hingga ayam empuk",
          ],
          waktu: 45,
        ),
      );

      // Bubur Kacang Hijau
      await HiveService.addResep(
        Resep(
          kalori: 320,
          kategori: "Makan Malam",
          gambar: "assets/images/buburkacang.png",
          jumlahBahan: 7,
          gambarBahan: [
            "https://upload.wikimedia.org/wikipedia/commons/0/0b/Mung_beans.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/3/33/Coconut_milk_in_glass.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/4/4c/Sugar_white_crystals.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/1/1f/Glass_of_milk.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/6/60/Vanilla_pods.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/2/26/Salt.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/8/8b/Water_glass.jpg",
          ],
          namaBahan: [
            "Kacang Hijau",
            "Santan",
            "Gula",
            "Susu",
            "Vanili",
            "Garam",
            "Air",
          ],
          nama: "Bubur Kacang Hijau",
          rating: 4.5,
          review: 120,
          langkah: [
            "Cuci bersih kacang hijau dan rendam selama 2 jam",
            "Rebus kacang hijau dengan air hingga lunak",
            "Tambahkan santan, gula, dan sedikit garam",
            "Masak sambil diaduk hingga kental",
            "Tambahkan susu dan vanili, aduk rata",
            "Angkat dan sajikan hangat",
          ],
          waktu: 50,
        ),
      );

      // Nasi Goreng
      await HiveService.addResep(
        Resep(
          kalori: 400,
          kategori: "Resep Cepat",
          gambar: "assets/images/nasigoreng.png",
          jumlahBahan: 8,
          gambarBahan: [
            "https://cdn.pixabay.com/photo/2014/12/21/23/28/steam-rice-576316_1280.jpg",
            "https://st5.depositphotos.com/26519602/64525/i/450/depositphotos_645252218-stock-photo-natural-chicken-egg-wooden-table.jpg",
            "https://pixabay.com/get/gars-1827018_1280.jpg",
            "https://images.pexels.com/photos/1111313/pexels-photo-1111313.jpeg",
            "https://cdn.pixabay.com/photo/2017/01/30/13/39/garlic-2024202_1280.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/2/26/Salt.jpg",
            "https://images.pexels.com/photos/2085459/pexels-photo-2085459.jpeg",
            "https://pixabay.com/get/olyw-602245_1280.jpg",
          ],
          namaBahan: [
            "Nasi Putih",
            "Telur",
            "Bawang Putih",
            "Cabai",
            "Kecap Manis",
            "Garam",
            "Daun Bawang",
            "Minyak Goreng",
          ],
          nama: "Nasi Goreng",
          rating: 4.6,
          review: 200,
          langkah: [
            "Panaskan minyak, tumis bawang dan cabai hingga harum",
            "Masukkan telur, orak-arik hingga matang",
            "Tambahkan nasi, aduk rata",
            "Tuang kecap manis, garam, dan daun bawang",
            "Aduk hingga semua tercampur rata dan panas",
            "Angkat dan sajikan hangat",
          ],
          waktu: 30,
        ),
      );

      // Sandwich
      await HiveService.addResep(
        Resep(
          kalori: 250,
          kategori: "Makan Pagi",
          gambar: "assets/images/sandwich.png",
          jumlahBahan: 7,
          gambarBahan: [
            "https://cdn.pixabay.com/photo/2017/12/09/08/18/bread-3007355_1280.png",
            "https://cdn.pixabay.com/photo/2017/05/07/08/56/lettuce-2294703_1280.jpg",
            "https://cdn.pixabay.com/photo/2018/01/09/15/35/tomatoes-3070545_1280.jpg",
            "https://cdn.pixabay.com/photo/2016/03/05/19/02/cheese-1238253_1280.jpg",
            "https://st5.depositphotos.com/26519602/64525/i/450/depositphotos_645252218-stock-photo-natural-chicken-egg-wooden-table.jpg",
            "https://cdn.pixabay.com/photo/2018/08/23/08/07/mayonnaise-3628701_1280.jpg",
            "https://cdn.pixabay.com/photo/2017/03/16/18/02/butter-2151348_1280.jpg",
          ],
          namaBahan: [
            "Roti Tawar",
            "Selada",
            "Tomat",
            "Keju",
            "Telur",
            "Mayones",
            "Mentega",
          ],
          nama: "Sandwich",
          rating: 4.4,
          review: 80,
          langkah: [
            "Oles roti dengan mentega dan mayones",
            "Tambahkan selada, irisan tomat, dan keju",
            "Masak telur sesuai selera dan letakkan di atas roti",
            "Tutup dengan roti lain dan tekan ringan",
            "Potong sandwich sesuai ukuran dan sajikan",
          ],
          waktu: 15,
        ),
      );

      // Pancake
      await HiveService.addResep(
        Resep(
          kalori: 300,
          kategori: "Sarapan",
          gambar: "assets/images/pancake.png",
          jumlahBahan: 7,
          gambarBahan: [
            "https://cdn.pixabay.com/photo/2017/01/20/00/30/flour-1995102_1280.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/1/1f/Glass_of_milk.jpg",
            "https://st5.depositphotos.com/26519602/64525/i/450/depositphotos_645252218-stock-photo-natural-chicken-egg-wooden-table.jpg",
            "https://cdn.pixabay.com/photo/2014/04/10/11/18/sugar-320984_1280.jpg",
            "https://cdn.pixabay.com/photo/2017/03/16/18/02/butter-2151348_1280.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/6/6f/Baking_powder.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/2/26/Salt.jpg",
          ],
          namaBahan: [
            "Tepung Terigu",
            "Susu",
            "Telur",
            "Gula",
            "Mentega",
            "Baking Powder",
            "Garam",
          ],
          nama: "Pancake",
          rating: 4.6,
          review: 95,
          langkah: [
            "Campur tepung, baking powder, gula, dan garam",
            "Kocok telur dan susu, lalu campurkan ke bahan kering",
            "Aduk hingga adonan rata dan tidak bergerindil",
            "Panaskan wajan, oles sedikit mentega",
            "Tuang adonan, masak hingga muncul gelembung, balik dan masak sisi lain",
            "Sajikan hangat dengan topping sesuai selera",
          ],
          waktu: 25,
        ),
      );

      // Scrumble Egg
      await HiveService.addResep(
        Resep(
          kalori: 200,
          kategori: "Makan Pagi",
          gambar: "assets/images/scrumbleeg.png",
          jumlahBahan: 5,
          gambarBahan: [
            "https://st5.depositphotos.com/26519602/64525/i/450/depositphotos_645252218-stock-photo-natural-chicken-egg-wooden-table.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/1/1f/Glass_of_milk.jpg",
            "https://cdn.pixabay.com/photo/2017/03/16/18/02/butter-2151348_1280.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/2/26/Salt.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/f/f6/Black_peppercorns.jpg",
          ],
          namaBahan: [
            "Telur", 
            "Susu", 
            "Mentega", 
            "Garam", 
            "Lada"
          ],
          nama: "Scrumble Egg",
          rating: 4.5,
          review: 60,
          langkah: [
            "Kocok telur dengan susu, garam, dan lada hingga rata",
            "Panaskan mentega di wajan",
            "Tuang telur, masak dengan api kecil sambil diaduk perlahan",
            "Masak hingga telur setengah matang dan lembut",
            "Angkat dan sajikan hangat",
          ],
          waktu: 10,
        ),
      );
    }
  }
}