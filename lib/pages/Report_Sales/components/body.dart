import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/pages/Report_Sales/components/report_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double profit = 0.0;

    List dataPenjualan = [
      {
        "createdAt": DateTime.now().toString(),
        "totalHarga": 1500000,
        "pelanggan": {"nama": "Rafi"}
      }
    ];
    List dataPelanggan = ["a", "b", "c", "d"];
    List dataProduk = ["a", "b", "c", "d"];

    int penjualan = dataPenjualan.length;
    int pelanggan = dataPelanggan.length;
    int produk = dataProduk.length;

    return MainBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Navbar(title: "Laporan"),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.sizeOf(context).width,
          height: 85,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ReportCard(
                  icon: Icons.money,
                  label: "Profit",
                  value:
                      "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(profit)}"),
              const SizedBox(width: 10),
              ReportCard(
                  icon: Icons.shopping_cart,
                  label: "Penjualan",
                  value: NumberFormat.decimalPatternDigits(
                          locale: "id", decimalDigits: 0)
                      .format(penjualan)),
              const SizedBox(width: 10),
              ReportCard(
                  icon: Icons.people,
                  label: "Pengunjung",
                  value: NumberFormat.decimalPatternDigits(
                          locale: "id", decimalDigits: 0)
                      .format(pelanggan)),
              const SizedBox(width: 10),
              ReportCard(
                  icon: Icons.warehouse_sharp,
                  label: "Jumlah barang",
                  value: NumberFormat.decimalPatternDigits(
                          locale: "id", decimalDigits: 0)
                      .format(produk)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Riwayat Penjualan :",
          style: GoogleFonts.inter(
              color: const Color(0xff4F200D),
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 286,
          child: ListView(children: [
            for (var data in dataPenjualan)
              RiwayatPenjualanCard(
                tanggal: data["createdAt"],
                pelanggan:
                    data["pelanggan"] != null ? data["pelanggan"]["nama"] : "",
                subtotal: data["totalHarga"].toString(),
              )
          ]),
        ),
      ],
    ));
  }
}

class RiwayatPenjualanCard extends StatelessWidget {
  const RiwayatPenjualanCard(
      {super.key,
      required this.tanggal,
      required this.subtotal,
      this.pelanggan});

  final String tanggal;
  final String subtotal;
  final String? pelanggan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xffFEDEAA),
          border: Border.all(color: const Color(0xff4F200D), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              DateFormat.yMd().format(DateTime.parse(tanggal)),
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        if (pelanggan!.isNotEmpty)
          Text(
            "Pelanggan : $pelanggan",
            style: GoogleFonts.inter(
                color: const Color(0xff4F200D),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        Text(
          "Profit : Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(double.parse(subtotal))}",
          style: GoogleFonts.inter(
              color: const Color(0xff4F200D),
              fontSize: 15,
              fontWeight: FontWeight.w700),
        )
      ]),
    );
  }
}
