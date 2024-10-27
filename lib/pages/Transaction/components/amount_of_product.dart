import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AmountOfProduct extends StatelessWidget {
  const AmountOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();
    RxInt jumlahProduct = 0.obs;

    Map produk = {
      "kodeBarang": "a4421",
      "nama": "Marimas",
      "harga": 15000,
      "stok": 15
    };

    return Modal(
      onTapBackdrop: () => {
        model.inputAmount.value = false,
      },
      height: 260,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Kode : ${produk["kodeBarang"]}",
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              child: Text(
                "Cari kembali",
                style: GoogleFonts.inter(
                    color: const Color(0xffFF8400),
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color(0xffE4DFD8), width: 3),
                  bottom: BorderSide(color: Color(0xffE4DFD8), width: 3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk["nama"],
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Harga : Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(produk["harga"])}",
                    style: GoogleFonts.inter(
                        color: const Color(0xffBD7E64),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Stok",
                    style: GoogleFonts.inter(
                        color: const Color(0xffBD7E64),
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "${produk["stok"]}",
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  if (jumlahProduct > 0) jumlahProduct--;
                },
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Color(0xff4F200D),
                )),
            Obx(
              () => SizedBox(
                width: jumlahProduct.toString().length * 20,
                child: TextField(
                    controller:
                        TextEditingController(text: jumlahProduct.toString()),
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                    decoration: const InputDecoration(
                        counterText: "",
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(vertical: 0)),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSubmitted: (value) =>
                        jumlahProduct.value = int.parse(value)),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (jumlahProduct < produk["stok"]!) jumlahProduct++;
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Color(0xff4F200D),
                ))
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            model.inputAmount.value = false;
            model.TotalCost();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF8400),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          child: Text(
            "Tambah",
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
