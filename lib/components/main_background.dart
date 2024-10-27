import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground(
      {super.key,
      required this.child,
      this.buttomButton,
      this.width,
      this.height});
  final Widget child;
  final Widget? buttomButton;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(color: Color(0xffF6F1E9)),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              width: width is double ? width : null,
              height: height is double ? height : null,
              decoration: const BoxDecoration(
                  color: Color(0xffF8F8F7),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: child),
          if (buttomButton is Widget) const SizedBox(height: 15),
          if (buttomButton is Widget) buttomButton!
        ],
      ),
    );
  }
}
