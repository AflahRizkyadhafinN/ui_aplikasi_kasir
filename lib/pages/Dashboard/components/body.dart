import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/pages/Dashboard/components/page_select.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    String role = "admin";
    List<Map> Menu = role == "admin" //Role :  Admin, Kasir
        ? [
            {
              "label": "Kasir",
              "icon": Icons.receipt,
              "onTap": () => Get.toNamed("/transaction")
            },
            {
              "label": "Stok",
              "icon": Icons.warehouse,
              "onTap": () => Get.toNamed("/listproduct")
            },
            {
              "label": "Pelanggan",
              "icon": Icons.people,
              "onTap": () => Get.toNamed("/customer")
            },
            {
              "label": "Laporan",
              "icon": Icons.description_outlined,
              "onTap": () => {
                    Get.toNamed("/reportsales"),
                  }
            },
            {
              "label": "Pegawai",
              "icon": Icons.perm_contact_cal_sharp,
              "onTap": () => Get.toNamed("/listemployee")
            },
          ]
        : [
            {
              "label": "Kasir",
              "icon": Icons.receipt,
              "onTap": () => Get.toNamed("/transaction")
            },
            {
              "label": "Stok",
              "icon": Icons.warehouse,
              "onTap": () => Get.toNamed("/listproduct")
            },
            {
              "label": "Pelanggan",
              "icon": Icons.people,
              "onTap": () => Get.toNamed("/customer")
            },
          ];

    return MainBackground(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height - 77,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/iconApp.png",
                  width: 50,
                ),
                GestureDetector(
                  onTap: () => {Get.toNamed("/")},
                  child: Text(
                    "Logout",
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.sizeOf(context).width,
                child: CustomPaint(
                  painter: DashedPainter(
                      dashPattern: [1, 1], color: const Color(0xffE4DFD8)),
                )),
            Text(
              "Selamat Datang",
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Aflah",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 227,
              margin: const EdgeInsets.only(top: 20),
              color: Colors.transparent,
              child: GridView.count(
                crossAxisCount:
                    (MediaQuery.sizeOf(context).width / 100 > Menu.length
                            ? Menu.length
                            : MediaQuery.sizeOf(context).width / 100)
                        .toInt(),
                children: [
                  for (var data in Menu)
                    PageSelect(
                      label: data["label"],
                      icon: data["icon"],
                      onTap: data["onTap"],
                    )
                ],
              ),
            )
          ],
        ));
  }
}
