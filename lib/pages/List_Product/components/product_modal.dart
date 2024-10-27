import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/List_Product/components/model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ProductModal extends StatelessWidget {
  const ProductModal({
    super.key,
    required this.onTapBackdrop,
  });

  final Function() onTapBackdrop;

  @override
  Widget build(BuildContext context) {
    // ProdukController produkController = Get.find();
    Model model = Get.find();

    RxString barcodeValue = "".obs;

    return Modal(
      height: 372,
      onTapBackdrop: onTapBackdrop,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTapBackdrop,
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Color(0xffFF8400),
                      size: 15,
                    ),
                    Text(
                      "Kembali",
                      style: GoogleFonts.inter(
                          color: const Color(0xffFF8400),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Text(
                model.modalType.value == "edit"
                    ? "Edit Produk"
                    : "Tambah Produk",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: CustomPaint(
                  painter: DashedPainter(
                color: const Color(0xffB2B2B2),
                dashPattern: [5, 5],
              ))),
          Column(
            children: [
              InputField(
                type: "NOB",
                label: "Kode Barang",
                onTapBarcode: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));

                  if (res is String && res != "-1") {
                    barcodeValue(res);
                  }
                },
                onChanged: (value) {},
              ),
              InputField(
                label: "Nama Barang",
                onChanged: (value) {},
              ),
              InputField(
                label: "Jumlah",
                onChanged: (value) {},
              ),
              InputField(
                label: "Harga (Rp)",
                onChanged: (value) {},
              ),
            ],
          ),
          GestureDetector(
            onTap: () => {
              Get.defaultDialog(
                  title: "Konfirmasi",
                  titleStyle: GoogleFonts.inter(
                      color: const Color(0xff4D200F),
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                  content: Column(
                    children: [
                      Text(
                        "Data sudah benar?",
                        style: GoogleFonts.inter(
                            color: const Color(0xff4D200F),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "kode :",
                        style: GoogleFonts.inter(
                            color: const Color(0xff4D200F),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "nama:",
                        style: GoogleFonts.inter(
                            color: const Color(0xff4D200F),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "jumlah : ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0)}",
                        style: GoogleFonts.inter(
                            color: const Color(0xff4D200F),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "harga : Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0)}",
                        style: GoogleFonts.inter(
                            color: const Color(0xff4D200F),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  confirm: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        model.showModal.value = false;
                      },
                      child: const Text("Confirm")),
                  cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"))),
            },
            child: Container(
                margin: const EdgeInsets.only(top: 15),
                width: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color: Color(0xffFF8400),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  model.modalType.value == "edit" ? "Update" : "Tambah",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      this.type,
      required this.label,
      required this.onChanged,
      this.onTapBarcode,
      this.controller});

  final String? type;
  final String label;
  final Function(String value) onChanged;
  final Function()? onTapBarcode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: type == "NOB" ? 214 : 248,
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 5),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff4F200D), width: 2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff4F200D), width: 2)),
                  labelText: label,
                  labelStyle: GoogleFonts.inter(
                      color: const Color(0xff4F200D),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          // ),
          if (type == "NOB")
            GestureDetector(
              onTap: onTapBarcode,
              child: const Icon(
                Icons.qr_code_scanner_rounded,
                size: 25,
                color: Color(0xff4F200D),
              ),
            )
        ],
      ),
    );
  }
}
