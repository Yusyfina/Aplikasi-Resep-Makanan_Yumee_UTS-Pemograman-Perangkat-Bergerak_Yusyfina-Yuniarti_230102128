import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';

class KategoriMenu extends StatelessWidget {
  final List<String> kategoriList;
  final String current;
  final Function(String) onTap;

  const KategoriMenu({
    super.key,
    required this.kategoriList,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kategori",
          style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor),
        ),
        const SizedBox(height:13),

        SizedBox(
          height:50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: kategoriList.length,
            separatorBuilder: (_, __)=> const SizedBox(width:12),
            itemBuilder:(context,i){
              final name = kategoriList[i];
              final selected = current == name;

              return GestureDetector(
                onTap:()=> onTap(name),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds:200),
                  padding: const EdgeInsets.symmetric(horizontal:18,vertical:10),
                  decoration: BoxDecoration(
                    color: selected? primaryColor:Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: selected ? [BoxShadow(
                      color: primaryColor.withAlpha(100),
                      spreadRadius:1,blurRadius:6,offset:Offset(0,3)
                    )]:[],
                  ),
                  child: Center(
                    child: Text(name,
                      style: TextStyle(
                        fontWeight:FontWeight.w700,
                        color:selected?Colors.white:primaryColor),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}