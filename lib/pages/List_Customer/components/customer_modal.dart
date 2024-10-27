import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerModal extends StatelessWidget {
  const CustomerModal(
      {super.key, required this.onTapBackdrop, this.type, this.idPelanggan});
  final Function() onTapBackdrop;
  final String? type;
  final String? idPelanggan;

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();

    return Modal(
      height: MediaQuery.sizeOf(context).height < 340
          ? MediaQuery.sizeOf(context).height
          : 340,
      onTapBackdrop: onTapBackdrop,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => model.showModalAddData.value = false,
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
                    ? "Edit Pelanggan"
                    : "Tambah Pelanggan",
                style: GoogleFonts.inter(
                    color: const Color(0xff4F200D),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              )
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
          InputField(
            label: "Kode Pelanggan",
            onChanged: (value) {},
          ),
          InputField(
            label: "Nama",
            onChanged: (value) {},
          ),
          InputField(
            label: "Alamat",
            onChanged: (value) {},
          ),
          InputField(
            label: "No Telepon",
            onChanged: (value) {},
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => model.showModalAddData(false),
                child: Container(
                    width: 110,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                onTap: () {
                  model.showModalAddData(false);
                },
                child: Container(
                    width: 110,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xffFF8400),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      model.modalType.value == "edit" ? "Edit" : "Tambah",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.label,
      required this.onChanged,
      this.controller});
  final String label;
  final Function(String value) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 248,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              cursorColor: const Color(0xff4F200D),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  hintText: label,
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
            )),
      ],
    );
  }
}
