import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal(
      {super.key,
      required this.onTapBackdrop,
      required this.type,
      this.name,
      required this.idAkun});
  final Function() onTapBackdrop;
  final String? name;
  final String type;
  final String idAkun;

  Widget confirmProperty() {
    return Column(
      children: [
        const Icon(
          Icons.warning_amber,
          size: 45,
          color: Color.fromARGB(255, 255, 72, 0),
        ),
        Text(
          "Enter Password",
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 72, 0),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Tulis password untuk verifikasi anda adalah admin",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: const Color(0xff4F200D),
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        Container(
          child: TextField(
            obscureText: true,
            style: GoogleFonts.inter(
                color: const Color(0xff4F200D),
                fontSize: 15,
                fontWeight: FontWeight.w600),
            cursorColor: const Color(0xff4F200D),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                hintText: "Password",
                hintStyle: GoogleFonts.inter(
                    color: const Color.fromRGBO(79, 32, 13, 0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff4F200D),
                )),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff4F200D)))),
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          child: Container(
              width: 110,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                color: Color(0xffFF8400),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                "Verifikasi",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
        )
      ],
    );
  }

  Widget deleteProperty() {
    Model model = Get.find();

    return Column(
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
              onTap: () => {model.confirmModalShow(false)},
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
        height: type == "confirmPassword" ? 285 : 250,
        onTapBackdrop: onTapBackdrop,
        child:
            type == "confirmPassword" ? confirmProperty() : deleteProperty());
  }
}
