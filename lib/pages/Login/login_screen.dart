import 'package:aplikasi_kasir/pages/Login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/images/login_background.jpg",
          //   width: MediaQuery.sizeOf(context).width,
          //   height: MediaQuery.sizeOf(context).height,
          //   fit: BoxFit.fill,
          // ),
          const SafeArea(
            child: Body(),
          ),
        ],
      ),
    );
  }
}
