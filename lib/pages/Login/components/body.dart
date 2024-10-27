import 'package:aplikasi_kasir/pages/Login/components/input_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/iconApp.png",
            width: 150,
          ),
          const SizedBox(height: 10),
          Text(
            "Aplikasi Kasir",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: const Color.fromRGBO(79, 32, 13, 1),
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 70),
          InputLogin(
            type: "kode petugas",
            onChange: (value) {},
          ),
          InputLogin(
            type: "password",
            onChange: (value) {},
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed("/dashboard");
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: const BoxDecoration(
                    color: Color(0xffFF8400),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
