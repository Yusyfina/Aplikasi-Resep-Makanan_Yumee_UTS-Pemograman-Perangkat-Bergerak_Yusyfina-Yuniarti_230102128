import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumee/utils/warna.dart';

class SearchFieldHome extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchFieldHome({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: primaryColor, 
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(
            Iconsax.search_normal,
            color: primaryColor
          ),
          fillColor: Colors.white,
          hintText: "Cari resep makanan...",
          hintStyle: TextStyle(
            color: primaryColor.withAlpha(150)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}