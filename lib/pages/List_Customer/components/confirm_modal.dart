import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal(
      {super.key,
      required this.onTapBackdrop,
      this.name,
      required this.idPelanggan});
  final Function() onTapBackdrop;
  final String? name;
  final String idPelanggan;

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();

    return Modal(
        height: 250,
        onTapBackdrop: onTapBackdrop,
        child: Column(
          children: [
            const Icon(
              Icons.warning,
              size: 45,
              color: Colors.red,
            ),
            Text(
              "Hapus Akun",
              style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 196, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Anda akan mengahapus akun dengan nama ",
                      style: GoogleFonts.inter(
                          color: const Color(0xff4F200D),
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                  TextSpan(
                      text: name,
                      style: GoogleFonts.inter(
                          color: const Color(0xff4F200D),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ])),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTapBackdrop,
                  child: Container(
                      width: 110,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xffFF8400),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        "Batal",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => {
                    model.confirmModalShow(false),
                  },
                  child: Container(
                      width: 110,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        "Hapus",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
