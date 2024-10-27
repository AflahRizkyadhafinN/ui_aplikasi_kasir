import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    this.customButton,
    this.addButton,
    this.onTapBackButton,
    this.onTapAddButton,
    required this.title,
  });

  final Widget? customButton;
  final bool? addButton;
  final Function()? onTapBackButton;
  final Function()? onTapAddButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff4F200D), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xff4F200D),
              size: 25,
            ),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.inter(
              color: const Color(0xff4F200D),
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
        customButton != null
            ? customButton!
            : addButton == true
                ? GestureDetector(
                    onTap: onTapAddButton,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff4F200D), width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff4F200D),
                        size: 25,
                      ),
                    ),
                  )
                : Container(width: 25)
      ],
    );
  }
}
