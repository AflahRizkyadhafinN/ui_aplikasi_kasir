import 'package:aplikasi_kasir/components/modal.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeModal extends StatelessWidget {
  const EmployeeModal(
      {super.key, required this.onTapBackdrop, this.type, this.idAkun});
  final Function() onTapBackdrop;
  final String? type;
  final String? idAkun;

  @override
  Widget build(BuildContext context) {
    Model model = Get.find();

    return Modal(
      height: MediaQuery.sizeOf(context).height < 380
          ? MediaQuery.sizeOf(context).height
          : 380,
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
                "Tambah akun",
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
            label: "Kode Petugas",
            onChanged: (value) {},
          ),
          InputField(
            label: "Nama",
            onChanged: (value) {},
          ),
          InputField(
            label: "Password",
            onChanged: (value) {},
          ),
          InputField(
            label: "Confirm Password",
            onChanged: (value) {},
          ),
          DropdownButtonFormField(
              style: GoogleFonts.inter(
                  color: const Color(0xff4F200D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xff4F200D),
                  )),
                  hintText: "Role",
                  hintStyle: GoogleFonts.inter(
                      color: const Color.fromRGBO(79, 32, 13, 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xff4F200D),
                  ))),
              items: [
                DropdownMenuItem(
                  value: "admin",
                  child: Text("Admin"),
                ),
                DropdownMenuItem(
                  value: "petugas",
                  child: Text("Petugas"),
                ),
              ],
              onChanged: (value) {}),
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
    RxBool showPassword = false.obs;

    return Row(
      children: [
        Obx(
          () => SizedBox(
              width: label == "Password" || label == "Confirm Password"
                  ? 223
                  : 248,
              child: TextField(
                controller: controller,
                obscureText: label == "Password" || label == "Confirm Password"
                    ? !showPassword.value
                    : showPassword.value,
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
        ),
        if (label == "Password" || label == "Confirm Password")
          Obx(
            () => GestureDetector(
              onTap: () => {
                showPassword.value = !showPassword.value,
                debugPrint(showPassword.value.toString())
              },
              child: Icon(
                showPassword.value
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline,
                color: const Color(0xff4F200D),
                size: 25,
              ),
            ),
          ),
      ],
    );
  }
}
