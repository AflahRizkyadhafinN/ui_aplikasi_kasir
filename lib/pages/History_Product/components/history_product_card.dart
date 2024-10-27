import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryProductCard extends StatelessWidget {
  const HistoryProductCard({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 5),
            height: 75,
            width: MediaQuery.sizeOf(context).width - 140,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color:
                    type == "penjualan" ? Colors.red[200] : Colors.green[200],
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(5)),
                border: Border.all(color: const Color(0xff4F200D), width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "03/04/2023",
                  style: GoogleFonts.inter(
                      color: const Color(0xff4F200D),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Indomie Rendang",
                  style: GoogleFonts.inter(
                      color: const Color(0xff4F200D),
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Text(
                  "Barang Terjual",
                  style: GoogleFonts.inter(
                      color: const Color(0xff4F200D),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 75,
          width: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: type == "penjualan" ? Colors.red[500] : Colors.green[500],
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(5)),
              border: const Border(
                  bottom: BorderSide(color: Color(0xff4F200D), width: 2),
                  top: BorderSide(color: Color(0xff4F200D), width: 2),
                  right: BorderSide(color: Color(0xff4F200D), width: 2))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Qty",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "1",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        )
      ],
    );
  }
}
