import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportCard extends StatelessWidget {
  const ReportCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xffFEDEAA),
          border: Border.all(color: const Color(0xff4F200D), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff4F200D),
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: GoogleFonts.inter(
              color: const Color(0xff4F200D),
              fontSize: 18,
              fontWeight: FontWeight.w700),
        )
      ]),
    );
  }
}
