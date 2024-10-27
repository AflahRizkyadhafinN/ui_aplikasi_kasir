// import 'package:aplikasi_kasir/components/modal.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_indicator/loading_indicator.dart';

// class Loading extends StatelessWidget {
//   const Loading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Modal(
//         height: 200,
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Text(
//             "Loading...",
//             style: GoogleFonts.inter(
//                 color: const Color(0xff4F200D),
//                 fontSize: 25,
//                 fontWeight: FontWeight.w700),
//           ),
//           Container(
//               margin: const EdgeInsets.only(top: 15),
//               width: 60,
//               child: const LoadingIndicator(
//                 indicatorType: Indicator.ballSpinFadeLoader,
//                 colors: [Color(0xff4F200D)],
//               ))
//         ]),
//         onTapBackdrop: () {});
//   }
// }
