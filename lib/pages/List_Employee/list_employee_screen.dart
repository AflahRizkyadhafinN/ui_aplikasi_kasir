import 'package:aplikasi_kasir/pages/List_Employee/components/body.dart';
import 'package:flutter/material.dart';

class ListEmployeeScreen extends StatelessWidget {
  const ListEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
