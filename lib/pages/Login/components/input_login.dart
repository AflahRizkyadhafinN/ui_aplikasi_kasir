import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputLogin extends StatelessWidget {
  const InputLogin({super.key, required this.type, required this.onChange});
  final String type;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    if (type != "kode petugas" && type != "password") {
      throw ArgumentError(
          "Invalid 'type' value. Accepted values are 'kode petugas' or 'password'.");
    }
    RxBool showPassword = true.obs;
    RxString valueInput = "".obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            type.replaceFirst(type[0], type[0].toUpperCase()),
            style: GoogleFonts.inter(
                color: const Color.fromRGBO(79, 32, 13, 1),
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: valueInput.value != ""
                        ? const Color.fromRGBO(0, 0, 0, 0.1)
                        : Colors.transparent,
                    border: Border.all(
                        color: const Color.fromRGBO(79, 32, 13, 1), width: 2),
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(4))),
                child: Icon(
                  type == "kode petugas"
                      ? Icons.person_outline
                      : Icons.key_outlined,
                  size: 32,
                  color: const Color.fromRGBO(79, 32, 13, 1),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: valueInput.value != ""
                        ? const Color.fromRGBO(0, 0, 0, 0.1)
                        : Colors.transparent,
                    border: const Border(
                      right: BorderSide(
                          color: Color.fromRGBO(79, 32, 13, 1), width: 2),
                      top: BorderSide(
                          color: Color.fromRGBO(79, 32, 13, 1), width: 2),
                      bottom: BorderSide(
                          color: Color.fromRGBO(79, 32, 13, 1), width: 2),
                    ),
                    borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(4))),
                child: Row(children: [
                  SizedBox(
                      width: type == "kode petugas"
                          ? MediaQuery.sizeOf(context).width - 122
                          : MediaQuery.sizeOf(context).width - 150,
                      child: TextField(
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(79, 32, 13, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: type,
                            hintStyle: GoogleFonts.inter(
                                color: const Color.fromRGBO(79, 32, 13, 0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                        obscureText:
                            type == "password" ? showPassword.value : false,
                        onChanged: onChange,
                      )),
                  const SizedBox(width: 5),
                  if (type == "password")
                    GestureDetector(
                      onTap: () => showPassword.value = !showPassword.value,
                      child: Icon(
                        showPassword.value
                            ? Icons.lock_outline
                            : Icons.lock_open_outlined,
                        size: 27,
                        color: const Color.fromRGBO(79, 32, 13, 1),
                      ),
                    )
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
