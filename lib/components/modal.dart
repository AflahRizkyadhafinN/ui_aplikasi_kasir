import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal(
      {super.key,
      required this.child,
      this.height,
      required this.onTapBackdrop});
  final Widget child;
  final double? height;
  final Function() onTapBackdrop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTapBackdrop,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black,
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffF6F1E9),
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            height: height is double ? height : 250,
            width: 320,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: const EdgeInsets.all(15),
                child: child),
          ),
        ),
      ],
    );
  }
}
