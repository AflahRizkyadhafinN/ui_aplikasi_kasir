import 'package:aplikasi_kasir/pages/List_Product/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListProductCard extends StatelessWidget {
  const ListProductCard(
      {super.key,
      required this.idProduk,
      required this.nama,
      required this.harga,
      required this.kode,
      required this.stok});

  final String idProduk;
  final String nama;
  final String kode;
  final int harga;
  final int stok;

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();

    RxBool showAction = false.obs;
    return Obx(
      () => showAction.value
          ? DeleteEditProduk(
              onBack: () => showAction.value = false,
              onEdit: () {
                model.idProduk(idProduk);
                model.modalType("edit");
                model.showModal(true);
                showAction(false);
              },
              onDelete: () => Get.defaultDialog(
                  title: "Hapus Produk",
                  content: Text("Anda akan menghapus $nama"),
                  confirm: ElevatedButton(
                      onPressed: () => {Get.back(), showAction(false)},
                      child: const Text("Confirm")),
                  cancel: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Cancel"))),
            )
          : ShowProduct(
              nama: nama,
              harga: harga,
              kode: kode,
              stok: stok,
              onTap: () => showAction.value = true,
            ),
    );
  }
}

class ShowProduct extends StatelessWidget {
  const ShowProduct(
      {super.key,
      required this.nama,
      required this.harga,
      required this.kode,
      required this.stok,
      required this.onTap});

  final String nama;
  final String kode;
  final int harga;
  final int stok;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 5),
              height: 75,
              width: MediaQuery.sizeOf(context).width - 140,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color(0xffFEDEAA),
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(5)),
                  border: Border.all(color: const Color(0xff4F200D), width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(79, 32, 13, 0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(harga)}",
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    kode,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 75,
            width: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Color(0xffFFD93D),
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(5)),
                border: Border(
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
                  stok.toString(),
                  style: GoogleFonts.inter(
                      color: const Color(0xff4F200D),
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DeleteEditProduk extends StatelessWidget {
  const DeleteEditProduk({
    super.key,
    required this.onBack,
    required this.onEdit,
    required this.onDelete,
  });

  final Function() onBack;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: const EdgeInsets.only(top: 5),
        height: 75,
        width: 30,
        decoration: const BoxDecoration(
            color: Color(0xffFEDEAA),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),
            border: Border(
                bottom: BorderSide(color: Color(0xff4F200D), width: 2),
                top: BorderSide(color: Color(0xff4F200D), width: 2),
                left: BorderSide(color: Color(0xff4F200D), width: 2))),
        child: IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4F200D),
            size: 25,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        height: 75,
        width: (MediaQuery.sizeOf(context).width - 110) / 2,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: const Color(0xffFEDEAA),
            border: Border.all(color: const Color(0xff4F200D), width: 2)),
        child: IconButton(
          onPressed: onEdit,
          icon: const Icon(
            Icons.edit,
            color: Color(0xff4F200D),
            size: 25,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        height: 75,
        width: (MediaQuery.sizeOf(context).width - 110) / 2,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 134, 125),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
            border: Border(
                bottom: BorderSide(color: Color(0xff4F200D), width: 2),
                top: BorderSide(color: Color(0xff4F200D), width: 2),
                right: BorderSide(color: Color(0xff4F200D), width: 2))),
        child: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 165, 0, 0),
              size: 25,
            )),
      )
    ]);
  }
}
