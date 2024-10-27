import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.kode, this.data});

  final String? kode;
  final RxMap? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data!["nama"],
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              Text(
                "@ Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(data!["harga"])}",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(data!["subTotal"])}",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              const SizedBox(height: 3),
              Obx(
                () => Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        if (data!["jumlah"] > 0) data!["jumlah"]--,
                      },
                      child: Container(
                        height: 23,
                        decoration: const BoxDecoration(
                            color: Color(0xffFFD93D),
                            border: Border(
                                top: BorderSide(color: Color(0xff4F200D)),
                                bottom: BorderSide(color: Color(0xff4F200D)),
                                left: BorderSide(color: Color(0xff4F200D))),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                topLeft: Radius.circular(4))),
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8F7),
                        border: Border.all(color: const Color(0xff4F200D)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        NumberFormat.decimalPatternDigits(
                                locale: "id", decimalDigits: 0)
                            .format(data!["jumlah"]),
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        data!["jumlah"]++,
                      },
                      child: Container(
                        height: 23,
                        decoration: const BoxDecoration(
                            color: Color(0xffFFD93D),
                            border: Border(
                                top: BorderSide(color: Color(0xff4F200D)),
                                bottom: BorderSide(color: Color(0xff4F200D)),
                                right: BorderSide(color: Color(0xff4F200D))),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(4),
                                topRight: Radius.circular(4))),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
