import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/screens/admin.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/screens/admin.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', width: 52),
        const SizedBox(width: 10),
        const Text(
          "Yumee",
          style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w900, color: primaryColor),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Iconsax.setting, color: primaryColor),
          onPressed: ()=> Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AdminPage())),
        ),
      ],
    );
  }
}