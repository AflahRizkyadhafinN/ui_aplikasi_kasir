import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();
    RxList listProduct = [
      {"kodeBarang": "ntr", "nama": "nutrisari", "harga": 1500}
    ].obs;

    return Modal(
      onTapBackdrop: () => model.inputKode.value = false,
      child: Column(
        children: [
          TextField(
            onChanged: (value) => {},
            style: GoogleFonts.inter(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
            decoration: InputDecoration(
                fillColor: const Color(0xffE2E2E2),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                hintText: "Masukan Kode Barang",
                hintStyle: GoogleFonts.inter(
                    color: const Color(0xffB0B0B0),
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 674,
            child: ListView(
              children: [
                for (var data in listProduct)
                  SearchCard(
                      kode: data["kodeBarang"],
                      label: data["nama"],
                      price: data["harga"],
                      onTap: () {
                        var check = model.listProduk
                            .where((element) =>
                                element["kode_barang"] == data["kodeBarang"])
                            .toList();
                        if (model.listProduk.isNotEmpty && check.isEmpty) {
                          model.kode.value = data["kodeBarang"];
                          model.inputKode.value = false;
                          model.inputAmount.value = true;
                        } else if (model.listProduk.isEmpty) {
                          model.kode.value = data["kodeBarang"];
                          model.inputKode.value = false;
                          model.inputAmount.value = true;
                        } else {
                          Get.snackbar("Data sudah ada",
                              "Barang yang anda input sudah ada");
                        }
                      })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.label,
    required this.kode,
    required this.price,
    required this.onTap,
  });

  final String label;
  final String kode;
  final int price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              Text(
                kode,
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
                "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(price)}",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
