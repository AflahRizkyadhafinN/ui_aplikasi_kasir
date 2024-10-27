import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageSelect extends StatelessWidget {
  const PageSelect(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap});

  final String label;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 206, 202, 196), width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Icon(
              icon,
              color: const Color(0xff4F200D),
              size: 40,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
                color: const Color(0xff4F200D),
                fontSize: 17,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
