import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerModal extends StatelessWidget {
  const CustomerModal({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();
    RxList listPelanggan = [
      {"idPelanggan": "a421sda", "kodePelanggan": "12224223", "nama": "Fikri"}
    ].obs;

    return Modal(
      onTapBackdrop: () => model.showCustomer.value = false,
      child: Column(children: [
        TextField(
          onChanged: (value) {},
          style: GoogleFonts.inter(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
          decoration: InputDecoration(
              fillColor: const Color(0xffE2E2E2),
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: "Cari nama pelanggan",
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
              for (var data in listPelanggan)
                SearchCard(
                    nama: data["nama"],
                    kode: data["kodePelanggan"],
                    onTap: () {
                      model.pelangganId(data["idPelanggan"]);
                      model.pelangganNama(data["nama"]);
                      model.showCustomer(false);
                    })
            ],
          ),
        ),
      ]),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.nama,
    required this.kode,
    required this.onTap,
  });

  final String nama;
  final String kode;
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
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
        ],
      ),
    );
  }
}
