import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/pages/Report_Product/components/product_report_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackground(
        height: MediaQuery.sizeOf(context).height - 77,
        child: ListView(
          children: [
            const Navbar(title: "Product"),
            const SizedBox(height: 15),
            Text(
              "Indomie Rendang",
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            Text(
              "kode : 88323654234234",
              style: GoogleFonts.inter(
                  color: const Color(0xffBD7E64),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            Text(
              "harga : Rp 3.500",
              style: GoogleFonts.inter(
                  color: const Color(0xffBD7E64),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            const SizedBox(height: 5),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Column(
                      children: [
                        Text(
                          "Persediaan",
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
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Column(
                      children: [
                        Text(
                          "Penjualan",
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
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "History Barang",
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            SizedBox(
              child: Column(
                children: [
                  const ProductReportCard(type: "penjualan"),
                  const ProductReportCard(type: "penjualan"),
                  const ProductReportCard(type: "pembelian"),
                  TextButton(
                      onPressed: () {}, child: const Text("data lainnya"))
                ],
              ),
            )
          ],
        ));
  }
}
