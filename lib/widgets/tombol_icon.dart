import 'package:flutter/material.dart';

class TombolIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback pressed;

  const TombolIcon({
    super.key,
    required this.icon,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon),
      ),
    );
  }
}