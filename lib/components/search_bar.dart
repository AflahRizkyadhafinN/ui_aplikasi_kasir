import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: GoogleFonts.inter(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
      decoration: InputDecoration(
          fillColor: const Color(0xffE2E2E2),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
              color: const Color(0xffB0B0B0),
              fontWeight: FontWeight.w700,
              fontSize: 13),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }
}
